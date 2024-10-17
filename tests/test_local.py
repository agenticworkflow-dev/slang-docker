import sglang as sgl
import time

def main():
    prompts = [
        "Who invented electrical motors?",
        "Which city is the capital of France?",
        "What are the main characters fo GenAI?",
    ]
    sampling_params = {"temperature": 0, "top_p": 1}
    llm = sgl.Engine(
        model_path="openbmb/MiniCPM-1B-sft-bf16",
        mem_fraction_static=0.7
    )

    print("start inferencing")
    marker = time.time()
    outputs = llm.generate(prompts, sampling_params)
    for prompt, output in zip(prompts, outputs):
        print("===============================")
        print(f"Prompt: {prompt}\nGenerated text: {output['text']}")
    print(f'exec in {time.time()-marker:.2f} secs')

if __name__ == "__main__":
    main()

