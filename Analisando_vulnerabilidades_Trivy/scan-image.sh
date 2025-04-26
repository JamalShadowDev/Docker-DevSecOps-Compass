#!/bin/bash

IMAGEM="python:3.9"
RELATORIO="relatorio_trivy.txt"

echo "🔍 Escaneando a imagem $IMAGEM..."
echo "===== RELATÓRIO DE VULNERABILIDADES: $IMAGEM =====" > $RELATORIO
echo "Data: $(date)" >> $RELATORIO
echo "" >> $RELATORIO

# Executa o scan e armazena resultado bruto
RAW_OUTPUT=$(trivy image --severity HIGH,CRITICAL --format json $IMAGEM)

# Processa as vulnerabilidades
echo "$RAW_OUTPUT" | jq -r '
  .Results[].Vulnerabilities[]? |
  select(.Severity == "HIGH" or .Severity == "CRITICAL") |
  "Pacote: \(.PkgName)\nVersão instalada: \(.InstalledVersion)\nVersão fixa: \(.FixedVersion // "N/A")\nSeveridade: \(.Severity)\nDescrição: \(.Title)\nCVE: \(.VulnerabilityID)\nRecomendação: \(.Description | gsub("\\n"; " ") | .[0:300] + "...")\n---"
' >> $RELATORIO

echo "" >> $RELATORIO
echo "📌 AÇÕES RECOMENDADAS:" >> $RELATORIO
echo "- Use uma imagem mais recente como 'python:3.11-slim' ou 'python:3.9-alpine'." >> $RELATORIO
echo "- Sempre mantenha o sistema e bibliotecas atualizados." >> $RELATORIO
echo "- Utilize um virtual environment no container (venv) para controle de pacotes." >> $RELATORIO
echo "- Atualize as dependências no requirements.txt com 'pip list --outdated' e 'pip install --upgrade'." >> $RELATORIO
echo "- Avalie o uso do Docker Slim para reduzir a superfície de ataque." >> $RELATORIO
echo "- Para CVEs específicos, busque no NVD (https://nvd.nist.gov) por detalhes e soluções." >> $RELATORIO

echo ""
echo "✅ Relatório salvo em '$RELATORIO'"