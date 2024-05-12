import google.generativeai as ai

ai.configure()

model = ai.GenerativeModel()
chat = model.start_chat([])
