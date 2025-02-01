import SwiftUI
import ARKit
import RealityKit
import ModelIO
import MetalKit

struct CameraView: View {
    @State private var isScanning = false
    @State private var modelURL: URL? = nil

    var body: some View {
        ZStack {
            ARViewContainer(isScanning: $isScanning, modelURL: $modelURL)
                .edgesIgnoringSafeArea(.all)

            VStack {
                Spacer()
                Button(action: {
                    isScanning.toggle()
                }) {
                    Text(isScanning ? "Stop Scanning" : "Activate 3D Scan")
                        .frame(width: 160, height: 40)
                        .padding()
                        .background(Color.blue.opacity(0.7))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
            }
        }
    }
}

struct ARViewContainer: UIViewRepresentable {
    @Binding var isScanning: Bool
    @Binding var modelURL: URL?

    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)

        guard ARWorldTrackingConfiguration.supportsSceneReconstruction(.mesh) else {
            print("This device does not support scene reconstruction.")
            return arView
        }

        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal, .vertical]
        config.environmentTexturing = .automatic
        config.sceneReconstruction = .mesh
        arView.session.run(config)

        arView.session.delegate = context.coordinator
        

        return arView
    }

    func updateUIView(_ uiView: ARView, context: Context) {
        if isScanning {
            uiView.scene.anchors.removeAll()
            uiView.debugOptions = [.showSceneUnderstanding]
        } else {
            uiView.debugOptions = []
            context.coordinator.processMeshAnchors()
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    class Coordinator: NSObject, ARSessionDelegate {
        var parent: ARViewContainer
        var meshAnchors: [ARMeshAnchor] = []
        
        init(parent: ARViewContainer) {
            self.parent = parent
        }
        
        func session(_ session: ARSession, didAdd anchors: [ARAnchor]) {
            for anchor in anchors {
                if let meshAnchor = anchor as? ARMeshAnchor {
                    meshAnchors.append(meshAnchor)
                }
            }
        }
        
        func processMeshAnchors() {
            guard !meshAnchors.isEmpty else {
                print("No mesh anchors to process.")
                return
            }

            // Create a Metal device
            guard let device = MTLCreateSystemDefaultDevice() else {
                print("Failed to get the system's default Metal device.")
                return
            }

            // Create an empty MDLAsset
            let asset = MDLAsset()
            
            for meshAnchor in meshAnchors {
                let geometry = meshAnchor.geometry
                let mdlMesh = toMDLMesh(geometry: geometry, device: device, transform: meshAnchor.transform)
                asset.add(mdlMesh)
            }
            
            // Export the asset to a file
            self.exportAsset(asset)
            
            // Clear the mesh anchors for the next scan
            meshAnchors.removeAll()
        }
        
        func toMDLMesh(geometry: ARMeshGeometry, device: MTLDevice, transform: simd_float4x4) -> MDLMesh {
            // Extract vertex data
            let vertexBuffer = geometry.vertices
            let vertexStride = vertexBuffer.stride
            let vertexBufferLength = vertexBuffer.buffer.length
            let vertexCount = vertexBufferLength / vertexStride
            
            let vertexData = Data(bytesNoCopy: vertexBuffer.buffer.contents(),
                                  count: vertexCount * vertexStride,
                                  deallocator: .none)
            
            let vertexDescriptor = MDLVertexDescriptor()
            vertexDescriptor.attributes[0] = MDLVertexAttribute(name: MDLVertexAttributePosition,
                                                                format: .float3,
                                                                offset: 0,
                                                                bufferIndex: 0)
            vertexDescriptor.layouts[0] = MDLVertexBufferLayout(stride: vertexStride)
            
            let vertexBufferAllocator = MTKMeshBufferAllocator(device: device)
            let mdlVertexBuffer = vertexBufferAllocator.newBuffer(with: vertexData, type: .vertex)
            
            // Extract index data
            let indexBuffer = geometry.faces
            let indexBufferLength = indexBuffer.buffer.length
            let indexStride = MemoryLayout<UInt32>.stride
            let indexCount = indexBufferLength / indexStride
            let faceCount = indexCount / 3 // Assuming each face is a triangle
            
            let indexData = Data(bytesNoCopy: indexBuffer.buffer.contents(),
                                 count: indexCount * indexStride,
                                 deallocator: .none)
            
            let mdlIndexBuffer = vertexBufferAllocator.newBuffer(with: indexData, type: .index)
            
            let submesh = MDLSubmesh(indexBuffer: mdlIndexBuffer,
                                     indexCount: indexCount,
                                     indexType: .uInt32,
                                     geometryType: .triangles,
                                     material: nil)
            
            let mdlMesh = MDLMesh(vertexBuffer: mdlVertexBuffer,
                                  vertexCount: vertexCount,
                                  descriptor: vertexDescriptor,
                                  submeshes: [submesh])
            
            // Apply the transform from the ARMeshAnchor
            mdlMesh.transform = MDLTransform(matrix: transform)
            
            return mdlMesh
        }
        
        func exportAsset(_ asset: MDLAsset) {
            // Define the file URL where you want to save the model
            let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            let fileURL = documentsDirectory.appendingPathComponent("scannedModel.usdz")

            // Remove existing file if it exists
            if FileManager.default.fileExists(atPath: fileURL.path) {
                do {
                    try FileManager.default.removeItem(at: fileURL)
                } catch {
                    print("Failed to remove existing file: \(error.localizedDescription)")
                }
            }

            // Export the asset to a USDZ file
            do {
                try asset.export(to: fileURL)
                print("Successfully exported 3D model to \(fileURL)")
                
                // Update your Item struct with the modelURL
                DispatchQueue.main.async {
                    self.parent.modelURL = fileURL
                    // Post a notification or update a shared model
                    // You can use delegation or closures to pass the URL back to your view
                }
            } catch {
                print("Failed to export 3D model: \(error.localizedDescription)")
            }
        }
    }
}



#Preview {
    CameraView()
}
