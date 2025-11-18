# Python Windows GUI script (no console window)
import tkinter as tk

root = tk.Tk()
root.title("Hello")
label = tk.Label(root, text="Hello, World!")
label.pack()
root.mainloop()