//
//  CoreDataBootcamp.swift
//  SwiftUIContinuedLearning
//
//  Created by Berkay Tuncel on 22.10.2023.
//

import SwiftUI
import CoreData

class CoreDataViewModel: ObservableObject {
    
    let container: NSPersistentContainer
    @Published var savedEntities: [FruitEntity] = []
    
    init() {
        container = NSPersistentContainer(name: "FruitsContainer")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("ERROR LOADING CORE DATA. \(error)")
            }
        }
        fetchFruits()
    }
    
    func fetchFruits() {
        let request = NSFetchRequest<FruitEntity>(entityName: "FruitEntity")
        
        do {
            savedEntities = try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching. \(error)")
        }
    }
    
    func addFruit(text: String) {
        let newFruit = FruitEntity(context: container.viewContext)
        newFruit.name = text
        saveData()
    }
    
    func updateFruit(entity: FruitEntity) {
        let currentName = entity.name ?? ""
        let newName = currentName + "!"
        entity.name = newName
        saveData()
    }
    
    func deleteFruit(indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        let entity = savedEntities[index]
        container.viewContext.delete(entity)
        saveData()
    }
    
    func saveData() {
        do {
            try container.viewContext.save()
            fetchFruits()
        } catch let error {
            print("Error saving. \(error)")
        }
    }
}

struct CoreDataBootcamp: View {
    
    @StateObject private var viewModel = CoreDataViewModel()
    @State private var textFieldText: String = ""
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                TextField("Add fruit here..", text: $textFieldText)
                    .font(.headline)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color.gray.opacity(0.3))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.horizontal)
                
                Button(action: {
                    guard !textFieldText.isEmpty else { return }
                    viewModel.addFruit(text: textFieldText)
                    textFieldText = ""
                }, label: {
                    Text("Button")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(.purple)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                })
                .padding(.horizontal)
                
                List {
                    ForEach(viewModel.savedEntities) { entity in
                        Text(entity.name ?? "unknown")
                            .onTapGesture {
                                viewModel.updateFruit(entity: entity)
                            }
                    }
                    .onDelete(perform: viewModel.deleteFruit)
                }
                .listStyle(.plain)
            }
            .navigationTitle("Fruits")
        }
    }
}

#Preview {
    CoreDataBootcamp()
}
