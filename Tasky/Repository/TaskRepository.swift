//
//  TaskRepository.swift
//  Tasky
//
//  Created by Giovanna Moeller on 29/05/24.
//

import Foundation

class TaskRepository {
    init() {
        loadTasks()
    }
    
    var tasks: [Task] = []
    private let userDefaults = UserDefaults.standard
    private let tasksKey = "tasky-app-tasks"
    
    private func saveTasks() {
        do {
            let tasksData = try JSONEncoder().encode(tasks)
            userDefaults.setValue(tasksData, forKey: tasksKey)
        } catch {
            print("Ocorreu um erro ao salvar as tarefas: \(error)")
        }
    }
    
    private func loadTasks() {
        guard let tasksData = userDefaults.data(forKey: tasksKey) else { return }
        do {
            tasks = try JSONDecoder().decode([Task].self, from: tasksData)
        } catch {
            print("Ocorreu um erro ao salvar as tarefas: \(error)")
        }
    }
    
    func addTask(newTask: Task) {
        tasks.append(newTask)
        saveTasks()
    }
    
    func completeTask(at index: Int) {
        guard index >= 0, index < tasks.count else { return }
        tasks[index].isCompleted.toggle()
        saveTasks()
    }
    
    func removeTask(at index: Int) {
        guard index >= 0, index < tasks.count else { return }
        tasks.remove(at: index)
        saveTasks()
    }
}
