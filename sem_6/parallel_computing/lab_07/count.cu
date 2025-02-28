#include <stdio.h>
#include <string.h>
#include <cuda_runtime.h>

__global__ void count_word_occurrences(char *sentence, char *word,
				       int sentence_length, int word_length,
				       int *count)
{
	int idx = blockIdx.x * blockDim.x + threadIdx.x;
	int stride = blockDim.x * gridDim.x;

	for (int i = idx; i < sentence_length - word_length + 1; i += stride) {
		bool match = true;
		for (int j = 0; j < word_length; j++) {
			if (sentence[i + j] != word[j]) {
				match = false;
				break;
			}
		}
		if (match)
			atomicAdd(count, 1);
	}
}

int main(void)
{
	const char *sentence = "The quick brown fox jumps over the lazy dog. The fox is quick.";
	const char *word = "the";
	int sentence_length = strlen(sentence);
	int word_length = strlen(word);

	char *d_sentence, *d_word;
	int *d_count, h_count = 0;

	cudaMalloc(&d_sentence, sentence_length * sizeof(char));
	cudaMalloc(&d_word, word_length * sizeof(char));
	cudaMalloc(&d_count, sizeof(int));

	cudaMemcpy(d_sentence, sentence, sentence_length * sizeof(char),
		   cudaMemcpyHostToDevice);
	cudaMemcpy(d_word, word, word_length * sizeof(char),
		   cudaMemcpyHostToDevice);
	cudaMemcpy(d_count, &h_count, sizeof(int), cudaMemcpyHostToDevice);

	int block_size = 256;
	int num_blocks = (sentence_length + block_size - 1) / block_size;

	count_word_occurrences<<<num_blocks, block_size>>>(d_sentence, d_word,
							   sentence_length,
							   word_length, d_count);

	cudaMemcpy(&h_count, d_count, sizeof(int), cudaMemcpyDeviceToHost);

	printf("The word '%s' appears %d times in the sentence.\n", word, h_count);

	cudaFree(d_sentence);
	cudaFree(d_word);
	cudaFree(d_count);

	return 0;
}
