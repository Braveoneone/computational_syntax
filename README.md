# computational_syntax
Coding files from the course LT2214 computational syntax 2024.

### Multilingual generation and translation (mini version)

For Chinese language, design a morphology for the main lexical types (N, A, V) with parameters and a couple of paradigms. Test it by implementing the lexicon in the MicroLang module. Define lincat N,A,V,V2 as well as the paradigms in MicroResource. The lexicon part of files MicroLangZh.gf and MicroResZh.gf for my language of choice Chinese. 
Define the linearization types of main phrasal categories - the remaining categories in MicroLang. Define the rest of the linearization rules in MicroLang. MicroLangZh.gf and MicroResZh.gf for my language of choice Chinese, with the lexicon part from above completed with syntax part.


### For GF(Grammatical Framework) Download and Installation
[Installation](https://www.grammaticalframework.org/download/index-3.11.html)

### Grammatical Framework Tutorial
[Tutorial](https://www.grammaticalframework.org/doc/tutorial/gf-tutorial.html#toc8)

### How to run my code?
> gf
> 
> i /MicroLangZh.gf
> 
> i /MicroResZh.gf
> 
> gr            generate Chinese grammar randomly
> 
> gr | l        generate Chinese sentence randomly

if it shows MicroResZh.gf does not exist
> i /yourFilePath/MicroLangZh.gf

