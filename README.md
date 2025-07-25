# 🕵️ snmp_enum - Ferramenta de Enumeração SNMP em Bash

Script Bash que automatiza a enumeração de informações em dispositivos que possuem SNMP habilitado. Ideal para administradores, auditores ou pentesters que precisam extrair dados de rede, sistema e dispositivos remotamente.

---

## ✅ Funcionalidades

Este script executa automaticamente uma série de consultas `snmpwalk` com OIDs úteis para extrair:

- Informações do sistema (descrição, uptime, etc.)
- Memória e unidades de armazenamento
- Interfaces de rede e IPs associados
- Tabela ARP (dispositivos conectados)
- Portas TCP locais
- Contas de usuários (se suportado)
- Softwares instalados e processos em execução
- Caminhos dos processos e total de processos ativos
- Tabela de rotas
- Informações específicas para Mikrotik (OID: `1.3.6.1.4.1.14988`)

---

## 💻 Requisitos

Este script depende de ferramentas comuns em sistemas Linux:

- `bash` (interpretador de shell)
- `snmpwalk` (parte do pacote `snmp` ou `net-snmp`)

### 🧱 Instalação dos requisitos

#### Debian, Ubuntu, Kali, Parrot:

```bash
sudo apt update
sudo apt install snmp -y
```

🚀 Como usar
Sintaxe:
`./snmp_enum.sh <IP_ALVO> <COMMUNITY> <VERSAO_SNMP>`

Exemplos:

```bash
./snmp_enum.sh 192.168.0.1 public 1
./snmp_enum.sh 10.0.0.254 public 2c
```

❗ Observações importantes:
A comunidade SNMP padrão na maioria dos dispositivos é public, mas pode variar.

📂 Saída
A saída será salva automaticamente em um arquivo chamado:

`snmp_enum_<IP>.txt`

Exemplo:
Se você escanear 192.168.1.1, a saída será:

`snmp_enum_192.168.1.1.txt`

Você pode visualizar o arquivo com:
`cat snmp_enum_192.168.1.1.txt`

🙌 Contribuições
Contribuições são bem-vindas! Sinta-se livre para abrir issues ou pull requests com melhorias, novos OIDs ou sugestões.

