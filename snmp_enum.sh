#!/bin/bash

# Função de ajuda
function mostrar_ajuda() {
    echo ""
    echo "🛠️  Uso correto:"
    echo "  $0 <IP_ALVO> <COMMUNITY> <VERSAO_SNMP>"
    echo ""
    echo "📌 Exemplos:"
    echo "  $0 192.168.0.1 public 1"
    echo "  $0 10.0.0.254 public 2c"
    echo ""
    echo "🔁 Versões SNMP suportadas: 1, 2c"
    echo ""
    exit 1
}

# Verificação de número de argumentos
if [ "$#" -ne 3 ]; then
    echo "❌ Erro: número incorreto de argumentos."
    mostrar_ajuda
fi

IP="$1"
COMMUNITY="$2"
VERSION="$3"

# Verificação da versão SNMP
if [[ "$VERSION" != "1" && "$VERSION" != "2c" ]]; then
    echo "❌ Erro: versão SNMP inválida."
    echo "➡️  Versões válidas: 1 ou 2c"
    mostrar_ajuda
fi

ARQUIVO_SAIDA="snmp_enum_$IP.txt"

echo "[+] Iniciando enumeração SNMP no alvo: $IP"
echo "Saída será salva em: $ARQUIVO_SAIDA"
echo "------------------------------------------" | tee "$ARQUIVO_SAIDA"

{
echo "[+] Informações do sistema:"
snmpwalk -v$VERSION -c $COMMUNITY $IP 1.3.6.1.2.1.1
echo

echo "[+] Informações sobre a memória:"
snmpwalk -v$VERSION -c $COMMUNITY $IP 1.3.6.1.2.1.25.2.3.1
echo

echo "[+] Interfaces de rede:"
snmpwalk -v$VERSION -c $COMMUNITY $IP 1.3.6.1.2.1.2.2.1.2
echo

echo "[+] Endereços IP associados às interfaces:"
snmpwalk -v$VERSION -c $COMMUNITY $IP 1.3.6.1.2.1.4.20.1.1
echo

echo "[+] Portas TCP locais:"
snmpwalk -v$VERSION -c $COMMUNITY $IP 1.3.6.1.2.1.6.13.1.3
echo

echo "[+] Contas de usuário:"
snmpwalk -v$VERSION -c $COMMUNITY $IP 1.3.6.1.4.1.77.1.2.25
echo

echo "[+] Nome do software:"
snmpwalk -v$VERSION -c $COMMUNITY $IP 1.3.6.1.2.1.25.6.3.1.2
echo

echo "[+] Unidades de armazenamento:"
snmpwalk -v$VERSION -c $COMMUNITY $IP 1.3.6.1.2.1.25.2.3.1.4
echo

echo "[+] Caminho dos processos:"
snmpwalk -v$VERSION -c $COMMUNITY $IP 1.3.6.1.2.1.25.4.2.1.4
echo

echo "[+] Programas em execução:"
snmpwalk -v$VERSION -c $COMMUNITY $IP 1.3.6.1.2.1.25.4.2.1.2
echo

echo "[+] Processos do sistema:"
snmpwalk -v$VERSION -c $COMMUNITY $IP 1.3.6.1.2.1.25.1.6.0
echo

echo "[+] Tabela ARP (dispositivos conectados):"
snmpwalk -v$VERSION -c $COMMUNITY $IP 1.3.6.1.2.1.4.22
echo

echo "[+] Rotas de rede (routing table):"
snmpwalk -v$VERSION -c $COMMUNITY $IP 1.3.6.1.2.1.4.21
echo

echo "[+] Dados adicionais (OID MikroTik):"
snmpwalk -v$VERSION -c $COMMUNITY $IP 1.3.6.1.4.1.14988
echo

echo "✅ Enumeração concluída."
} | tee -a "$ARQUIVO_SAIDA"

