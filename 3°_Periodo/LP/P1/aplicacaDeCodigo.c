int a = 10;

void f() {
  int b = 10;
  static int c = 10;
  printf("a = %d, b = %d, c = %d\n", a, b, c);
  a = a + 20;
  b = b + 10;
  c = c + 10;
}

void main() {
  while (a <= 100) {
    f();
  }
}
