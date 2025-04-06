import java.time.LocalDateTime;

/**
 * Classe que representa um agendamento no sistema.
 * Relaciona um Cliente com um Serviço em uma data específica.
 */
public class Agendamento {
    
    // ========== ATRIBUTOS ========== //
    private final int idAgendamento; // Chave primária
    private final Cliente cliente;   // Composição com Cliente
    private final Servico servico;   // Composição com Serviço
    private final LocalDateTime dataHora;
    private String status;           // Ex: "agendado", "cancelado", "concluído"
    private String observacoes;

    // ========== CONSTRUTOR ========== //
    /**
     * Construtor principal
     * @param idAgendamento Identificador único
     * @param cliente Objeto Cliente (já existente)
     * @param servico Objeto Servico (já existente)
     * @param dataHora Data e hora do agendamento
     */
    public Agendamento(int idAgendamento, Cliente cliente, Servico servico, LocalDateTime dataHora) {
        this.idAgendamento = idAgendamento;
        this.cliente = cliente;
        this.servico = servico;
        this.dataHora = dataHora;
        this.status = "agendado"; // Status padrão
        this.observacoes = "";
    }

    // ========== MÉTODOS GETTERS ========== //
    public int getIdAgendamento() {
        return idAgendamento;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public Servico getServico() {
        return servico;
    }

    public LocalDateTime getDataHora() {
        return dataHora;
    }

    public String getStatus() {
        return status;
    }

    public String getObservacoes() {
        return observacoes;
    }

    // ========== MÉTODOS SETTERS ========== //
    public void setStatus(String status) {
        if (!status.equals("agendado") && !status.equals("cancelado") && !status.equals("concluído")) {
            throw new IllegalArgumentException("Status inválido");
        }
        this.status = status;
    }

    public void setObservacoes(String observacoes) {
        this.observacoes = observacoes;
    }

    // ========== MÉTODOS DE NEGÓCIO ========== //
    /**
     * Calcula o preço total com possível desconto
     * @param desconto Percentual de desconto (0-100)
     * @return Valor com desconto aplicado
     */
    public double calcularPrecoComDesconto(double desconto) {
        if (desconto < 0 || desconto > 100) {
            throw new IllegalArgumentException("Desconto inválido");
        }
        return servico.getPreco() * (1 - desconto/100);
    }

    /**
     * Verifica se o agendamento está ativo
     * @return true se status for "agendado"
     */
    public boolean estaAtivo() {
        return status.equals("agendado");
    }

    // ========== MÉTODO toString ========== //
    @Override
    public String toString() {
        return String.format(
            "Agendamento [ID=%d]\nCliente: %s\nServiço: %s\nData: %s\nStatus: %s\nPreço: R$%.2f",
            idAgendamento,
            cliente.getNome(),
            servico.getNomeServico(),
            dataHora.toString(),
            status,
            servico.getPreco()
        );
    }

    // ========== EXEMPLO DE USO ========== //
    public static void main(String[] args) {
        // Criando objetos necessários
        Cliente cliente = new Cliente(1, "João Silva", "(11) 98765-4321");
        Servico servico = new Servico(1, "Corte Masculino", 40.00);
        
        // Criando agendamento
        LocalDateTime data = LocalDateTime.of(2023, 12, 15, 14, 30);
        Agendamento agendamento = new Agendamento(1, cliente, servico, data);
        
        // Adicionando observações
        agendamento.setObservacoes("Trazer carteirinha de estudante");
        
        // Exibindo agendamento
        System.out.println(agendamento.toString());
        System.out.println("\nPreço com 10% desconto: R$" + agendamento.calcularPrecoComDesconto(10));
        
        // Cancelando agendamento
        agendamento.setStatus("cancelado");
        System.out.println("\nStatus atual: " + agendamento.getStatus());
        System.out.println("Está ativo? " + agendamento.estaAtivo());
    }
}