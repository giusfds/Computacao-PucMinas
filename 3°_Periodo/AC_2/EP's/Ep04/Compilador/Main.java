import java.io.*;
import java.util.HashMap;
import java.util.Map;

public class Main {

    public static String procurarMnemônico(String string) {
        Map<String, String> tabela = new HashMap<>();
        tabela.put("zeroL", "0");
        tabela.put("umL", "1");
        tabela.put("copiaA", "2");
        tabela.put("copiaB", "3");
        tabela.put("nA", "4");
        tabela.put("nB", "5");
        tabela.put("AenB", "6");
        tabela.put("nAeB", "7");
        tabela.put("AxB", "8");
        tabela.put("nAxnB", "9");
        tabela.put("nAxnBn", "A");
        tabela.put("AeB", "B");
        tabela.put("AeBn", "C");
        tabela.put("AoBn", "D");
        tabela.put("AoB", "E");
        tabela.put("nAonBn", "F");

        return tabela.getOrDefault(string, "Erro");
    }

    public static void main(String[] args) {
        try {
            // Abrindo os arquivos
            BufferedReader arq = new BufferedReader(new FileReader("testeula.ula"));
            BufferedWriter saida = new BufferedWriter(new FileWriter("testeula.hex"));

            String linha;
            String X = "";
            String Y = "";

            while ((linha = arq.readLine()) != null) {
                linha = linha.trim();

                if (linha.equals("inicio:")) {
                    continue;

                } else if (linha.startsWith("X")) {
                    X = linha.split("=")[1].replace(";", "").trim();

                } else if (linha.startsWith("Y")) {
                    Y = linha.split("=")[1].replace(";", "").trim();

                } else if (linha.startsWith("W")) {
                    if (X.isEmpty() || Y.isEmpty()) {
                        System.out.println("Erro, X ou Y não foram definidos antes da primeira operação.");
                    } else {
                        String W = linha.split("=")[1].replace(";", "").trim();
                        try {
                            int x = Integer.parseInt(X);
                            int y = Integer.parseInt(Y);
                            // Escreve no arquivo de saída o formato desejado
                            saida.write(String.format("%X%X%s%n", x, y, procurarMnemônico(W)));
                        } catch (NumberFormatException e) {
                            System.out.println("Erro ao converter X ou Y para inteiro: " + e.getMessage());
                        }
                    }

                } else if (linha.equals("fim.")) {
                    break;
                }
            }

            // Fechando os arquivos
            arq.close();
            saida.close();

        } catch (IOException e) {
            System.out.println("Erro ao processar os arquivos: " + e.getMessage());
        }
    }
}
