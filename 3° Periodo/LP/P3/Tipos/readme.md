# Sistemas de Tipos
### 1. **Sistema de Tipos**
   - Define regras para atribuir tipos a diferentes partes de um programa, como variáveis e funções.
   - Verificadores de tipo utilizam essas regras para garantir que operações sejam feitas em tipos compatíveis, evitando erros de execução.

### 2. **Monomorfismo**
   - Tipos fixos para variáveis, constantes e funções; uma abordagem que simplifica a verificação, mas limita a reutilização.
   - **Exemplo em C**: Em C, variáveis devem ser declaradas com tipos fixos, como `int`, `float`.
     ```c
     int soma(int a, int b) {
         return a + b;
     }
     ```
   - Aqui, `soma` aceita apenas `int`, limitando seu uso com outros tipos, como `float`.

### 3. **Sobrecarga**
   - Associações diferentes ao mesmo identificador ou operador, também chamado de polimorfismo ad-hoc.
   - Em C, funções sobrecarregadas não são permitidas, mas operadores como `+` funcionam para `int` e `float`.

### 4. **Polimorfismo**
   - Abstrações que funcionam com vários tipos, conhecido como polimorfismo paramétrico.
   - Em linguagens como ML, funções podem operar sobre qualquer tipo.
   - **Em C**: Embora C não suporte polimorfismo nativo, macros podem simular isso:
     ```c
     #define MAX(a, b) ((a) > (b) ? (a) : (b))
     ```
   - A macro `MAX` funciona com qualquer tipo numérico.

### 5. **Tipos Parametrizados**
   - Tipos que aceitam outros tipos como parâmetros, como arrays e structs.
   - **Exemplo em C**: `typedef` permite criar estruturas parametrizadas:
     ```c
     typedef struct {
         int primeiro;
         int segundo;
     } ParInt;
     ```
   - `ParInt` permite pares de inteiros, podendo ser adaptado para outros tipos manualmente.

### 6. **Politipos**
   - Tipos que contêm variáveis de tipo, derivando uma família de tipos específicos, como listas.
   - Em linguagens monomórficas, como C, é possível simular com ponteiros genéricos (`void *`).

### 7. **Inferência de Tipo**
   - Determina automaticamente o tipo de uma entidade sem declaração explícita, comum em linguagens como ML.
   - Em C, não há inferência de tipo, exigindo declarações explícitas.

### 8. **Coerção**
   - Conversão automática de um tipo em outro quando necessário.
   - **Exemplo em C**: Operações entre `int` e `float` realizam coerções automáticas.
     ```c
     float resultado = 5 + 3.2; // `5` é convertido implicitamente para `float`.
     ```

### 9. **Subtipos e Herança**
   - Relacionado à herança de operações de supertipos, especialmente em OOP.
   - C não possui subtipos nativamente, mas herança pode ser simulada com structs e ponteiros.


#### 1. **Monomorfismo e Sobrecarga em C++**
   - Em C++, funções podem ser sobrecarregadas, permitindo múltiplas versões da mesma função com diferentes tipos de parâmetro.
   - **Exemplo**:
     ```cpp
     int soma(int a, int b) { return a + b; }
     double soma(double a, double b) { return a + b; }
     ```
   - Aqui, `soma` aceita tanto `int` quanto `double`, escolhendo automaticamente a versão correta com base nos tipos dos argumentos.

#### 2. **Polimorfismo e Tipos Parametrizados**
   - C++ permite criar classes e funções genéricas, usando templates, o que facilita a criação de código reutilizável.
   - **Exemplo de template**:
     ```cpp
     template <typename T>
     T max(T a, T b) {
         return (a > b) ? a : b;
     }
     ```
   - A função `max` pode ser chamada com qualquer tipo que suporte o operador `>`.

#### 3. **Politipos e Inferência de Tipo**
   - Com `auto`, C++ pode inferir automaticamente o tipo de uma variável a partir de seu valor de inicialização.
   - **Exemplo**:
     ```cpp
     auto x = 10; // O tipo de `x` é inferido como `int`.
     auto y = max(5.5, 3.2); // O tipo de `y` é inferido como `double`.
     ```
   - `auto` simplifica o código e permite flexibilidade sem precisar declarar explicitamente cada tipo.

#### 4. **Herança e Subtipos**
   - Em C++, a herança permite que uma classe (`subtipo`) herde métodos e atributos de outra (`supertipo`).
   - **Exemplo**:
     ```cpp
     class Animal {
     public:
         void fazerSom() { cout << "Som de animal\n"; }
     };

     class Cachorro : public Animal {
     public:
         void fazerSom() { cout << "Latido\n"; } // Sobrescreve o método `fazerSom`
     };
     ```
   - `Cachorro` é um subtipo de `Animal` e herda seus métodos, podendo substituí-los (polimorfismo de inclusão).

#### 5. **Coerção**
   - C++ permite coerção automática entre tipos numéricos e entre tipos relacionados por herança.
   - **Exemplo**:
     ```cpp
     Animal* a = new Cachorro(); // `Cachorro` é convertido para `Animal` automaticamente.
     ```

#### 6. **Polimorfismo em Tempo de Execução**
   - C++ permite polimorfismo dinâmico, onde o tipo específico de um objeto é resolvido em tempo de execução.
   - **Exemplo usando polimorfismo com ponteiros**:
     ```cpp
     Animal* animal = new Cachorro();
     animal->fazerSom(); // Chama `fazerSom` de `Cachorro` devido ao polimorfismo.
     ```
