import java.time.LocalDateTime;

public class App {
    public static void main(String[] args) {
        // Criando cliente
        Cliente cliente1 = new Cliente(1, "Maria Oliveira", "(11) 98765-4321");
    
        // Exibindo dados do cliente
        System.out.println(cliente1.toString());
        
        // Alterando o telefone
        cliente1.setTelefone("(11) 91234-5678");
        System.out.println("Telefone atualizado: " + cliente1.getTelefone());
        
        // Criando serviços
        Servico corte = new Servico(1, "Corte Masculino", 40.00);
        Servico coloracao = new Servico(2, "Coloração", 120.50);
        
        // Exibindo serviços
        System.out.println(corte.toString());
        System.out.println(coloracao);
        
        // Alterando preço
        coloracao.setPreco(135.90);
        System.out.println("Novo preço: " + coloracao.getPreco());
        
        // Tentativa de preço inválido
        try {
            corte.setPreco(-10.00); // Lança IllegalArgumentException
        } catch (IllegalArgumentException e) {
            System.out.println("Erro: " + e.getMessage());
        }

        // Criando agendamento usando o cliente1 e o serviço corte já criados
        LocalDateTime data = LocalDateTime.of(2023, 12, 15, 14, 30);
        Agendamento agendamento = new Agendamento(1, cliente1, corte, data);
        
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