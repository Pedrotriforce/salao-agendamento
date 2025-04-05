/**
 * Classe que representa um serviço oferecido pelo sistema.
 * Contém informações como identificador único, nome do serviço e preço.
 */
public class Servico {
    
    // ========== ATRIBUTOS ========== //
    
    /**
     * ID único do serviço (chave primária no banco de dados)
     * - private: encapsulado, só acessível dentro da classe
     * - final: imutável após inicialização
     */
    private final int idServico;
    
    /**
     * Nome do serviço oferecido
     * - String: tipo para armazenar texto
     */
    private String nomeServico;
    
    /**
     * Preço do serviço
     * - double: tipo para valores decimais (ex: R$ 150.99)
     */
    private double preco;

    // ========== CONSTRUTOR ========== //
    
    /**
     * Construtor da classe Servico.
     * @param idServico Identificador único do serviço (PK)
     * @param nomeServico Nome/descrição do serviço
     * @param preco Valor cobrado pelo serviço
     */
    public Servico(int idServico, String nomeServico, double preco) {
        this.idServico = idServico;
        this.nomeServico = nomeServico;
        this.preco = preco;
    }

    // ========== MÉTODOS GETTERS ========== //
    
    /**
     * Retorna o ID do serviço
     * @return int ID único
     */
    public int getIdServico() {
        return idServico;
    }

    /**
     * Retorna o nome do serviço
     * @return String nome/descrição
     */
    public String getNomeServico() {
        return nomeServico;
    }

    /**
     * Retorna o preço do serviço
     * @return double valor em reais
     */
    public double getPreco() {
        return preco;
    }

    // ========== MÉTODOS SETTERS ========== //
    
    /**
     * Altera o nome do serviço
     * @param novoNome Novo nome/descrição
     */
    public void setNomeServico(String novoNome) {
        // Pode adicionar validações (ex: não vazio)
        this.nomeServico = novoNome;
    }

    /**
     * Altera o preço do serviço
     * @param novoPreco Novo valor (deve ser positivo)
     */
    public void setPreco(double novoPreco) {
        if (novoPreco <= 0) {
            throw new IllegalArgumentException("Preço deve ser positivo");
        }
        this.preco = novoPreco;
    }

    // ========== MÉTODO toString ========== //
    
    /**
     * Retorna uma representação em String do serviço
     * @return String formatada
     */
    @Override
    public String toString() {
        return String.format(
            "Servico [ID=%d, Nome=%s, Preço=R$%.2f]",
            idServico, nomeServico, preco
        );
    }

    // ========== EXEMPLO DE USO ========== //
    public static void main(String[] args) {
        // Criando serviços
        Servico corte = new Servico(1, "Corte Masculino", 40.00);
        Servico coloracao = new Servico(2, "Coloração", 120.50);
        
        // Exibindo serviços
        System.out.println(corte.toString());
        // Saída: Servico [ID=1, Nome=Corte Masculino, Preço=R$40.00]
        
        System.out.println(coloracao);
        // Saída implícita do toString(): Servico [ID=2, Nome=Coloração, Preço=R$120.50]
        
        // Alterando preço
        coloracao.setPreco(135.90);
        System.out.println("Novo preço: " + coloracao.getPreco());
        // Saída: Novo preço: 135.9
        
        // Tentativa de preço inválido
        try {
            corte.setPreco(-10.00); // Lança IllegalArgumentException
        } catch (IllegalArgumentException e) {
            System.out.println("Erro: " + e.getMessage());
            // Saída: Erro: Preço deve ser positivo
        }
    }
}