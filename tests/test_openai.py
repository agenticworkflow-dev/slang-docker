import openai
client = openai.Client(
    base_url="http://127.0.0.1:30000/v1", api_key="EMPTY")

# Text completion
response = client.completions.create(
	model="default",
	prompt="The capital of France is",
	temperature=0,
	max_tokens=32,
)
print(response)

# Chat completion
response = client.chat.completions.create(
    model="default",
    messages=[
        {"role": "system", "content": "You are a helpful AI assistant"},
        {"role": "user", "content": "What is the definition of Generative AI?"},
    ],
    temperature=0,
    max_tokens=512,
)
print(response)

## Text embedding
# response = client.embeddings.create(
#     model="default",
#     input="How are you today",
# )
# print(response)
