import java.time.LocalDate; // Importa a classe para manipulação de datas

/**
 * Classe que representa um cliente no sistema.
 * Modela os dados básicos de um cliente com ID único, nome, telefone e data de cadastro.
 */
public class Cliente {
    
    // ========== ATRIBUTOS ========== //
    
    /**
     * ID único do cliente (chave primária no banco de dados)
     * - private: acesso restrito apenas à própria classe
     * - final: não pode ser alterado após a inicialização (imutável)
     */
    private final int idCliente;
    
    /**
     * Nome completo do cliente
     * - String: tipo para armazenar texto
     */
    private String nome;
    
    /**
     * Telefone para contato
     * - String: permite armazenar formatos com caracteres especiais ((), -, etc.)
     */
    private String telefone;
    
    /**
     * Data de cadastro do cliente no sistema
     * - LocalDate: armazena apenas data (sem hora)
     * - final: não pode ser alterada após a criação do objeto
     */
    private final LocalDate dataCadastro;

    // ========== CONSTRUTOR ========== //
    
    /**
     * Construtor da classe Cliente.
     * @param idCliente Identificador único do cliente (PK)
     * @param nome Nome completo do cliente
     * @param telefone Telefone para contato
     * 
     * - LocalDate.now() define automaticamente a data atual como data de cadastro
     */
    public Cliente(int idCliente, String nome, String telefone) {
        this.idCliente = idCliente; // Atribui o ID (não pode ser alterado depois)
        this.nome = nome;
        this.telefone = telefone;
        this.dataCadastro = LocalDate.now(); // Define a data atual automaticamente
    }

    // ========== MÉTODOS GETTERS ========== //
    
    /**
     * Retorna o ID do cliente
     * @return int ID único do cliente
     */
    public int getIdCliente() {
        return idCliente;
    }

    /**
     * Retorna o nome do cliente
     * @return String nome completo
     */
    public String getNome() {
        return nome;
    }

    /**
     * Retorna o telefone do cliente
     * @return String telefone para contato
     */
    public String getTelefone() {
        return telefone;
    }

    /**
     * Retorna a data de cadastro
     * @return LocalDate data do cadastro (imutável)
     */
    public LocalDate getDataCadastro() {
        return dataCadastro;
    }

    // ========== MÉTODOS SETTERS ========== //
    
    /**
     * Define um novo nome para o cliente
     * @param novoNome Novo nome a ser atribuído
     */
    public void setNome(String novoNome) {
        // Pode adicionar validações aqui
        this.nome = novoNome;
    }

    /**
     * Define um novo telefone para o cliente
     * @param novoTelefone Novo telefone a ser atribuído
     */
    public void setTelefone(String novoTelefone) {
        // Pode adicionar validações de formato aqui
        this.telefone = novoTelefone;
    }

    // ========== MÉTODO toString ========== //
    
    /**
     * Retorna uma representação em String do objeto Cliente
     * @return String formatada com todos os dados do cliente
     */
    @Override
    public String toString() {
        return "Cliente [ID=" + idCliente 
                + ", Nome=" + nome 
                + ", Telefone=" + telefone 
                + ", Data Cadastro=" + dataCadastro 
                + "]";
    }

    // ========== EXEMPLO DE USO ========== //
    public static void main(String[] args) {
        // Criando um novo cliente
        Cliente cliente1 = new Cliente(1, "Maria Oliveira", "(11) 98765-4321");
        
        // Exibindo dados do cliente
        System.out.println(cliente1.toString());
        // Saída: Cliente [ID=1, Nome=Maria Oliveira, Telefone=(11) 98765-4321, Data Cadastro=2023-10-25]
        
        // Alterando o telefone
        cliente1.setTelefone("(11) 91234-5678");
        System.out.println("Telefone atualizado: " + cliente1.getTelefone());
        // Saída: Telefone atualizado: (11) 91234-5678
        
        // Tentando alterar o ID (não permitido - gera erro de compilação)
        // cliente1.idCliente = 2; // ERRO: Cannot assign a value to final variable
    }
}