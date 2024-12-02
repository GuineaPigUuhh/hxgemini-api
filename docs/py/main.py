import google.generativeai as ai

ai.configure(api_key='')

model = ai.GenerativeModel()
chat = model.start_chat([])
