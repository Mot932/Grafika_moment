import tkinter as tk
from tkinter import filedialog
import re
import pymorphy3
import collections
from wordcloud import WordCloud
from PIL import Image

class TextAnalyser:
    def __init__(self, file_name=None, pos_list=['VERB', 'NOUN']) -> None:
        # Код TextAnalyser остается без изменений

class TextAnalyserGUI:
    def __init__(self, root):
        self.root = root
        self.root.title("Text Analyser")
        
        # Создаем метку для выбора файла
        self.label = tk.Label(root, text="Выберите файл для анализа:")
        self.label.pack()
        
        # Кнопка для выбора файла
        self.file_button = tk.Button(root, text="Выбрать файл", command=self.choose_file)
        self.file_button.pack()
        
        # Поле для ввода желаемых частей речи
        self.pos_label = tk.Label(root, text="Введите желаемые части речи (через запятую):")
        self.pos_label.pack()
        
        self.pos_entry = tk.Entry(root)
        self.pos_entry.pack()
        
        # Кнопка для запуска анализа
        self.analyse_button = tk.Button(root, text="Анализировать", command=self.analyse_text)
        self.analyse_button.pack()
        
    def choose_file(self):
        # Открываем диалоговое окно для выбора файла
        file_path = filedialog.askopenfilename()
        if file_path:
            self.file_name = file_path
            self.label.config(text=f"Выбран файл: {self.file_name}")
    
    def analyse_text(self):
        # Получаем желаемые части речи из поля ввода
        pos_str = self.pos_entry.get()
        pos_list = [pos.strip() for pos in pos_str.split(',')]
        
        # Создаем экземпляр TextAnalyser и передаем параметры
        try:
            analyser = TextAnalyser(file_name=self.file_name, pos_list=pos_list)
        except Exception as e:
            self.label.config(text=str(e))

if __name__ == "__main__":
    root = tk.Tk()
    app = TextAnalyserGUI(root)
    root.mainloop()
