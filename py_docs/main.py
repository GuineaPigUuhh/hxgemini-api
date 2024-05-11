import google.generativeai as genai

genai.configure()

model = genai.GenerativeModel('gemini-pro', None, None)