#!/usr/bin/env python3
"""
Script de teste para verificar se os logs do Python estão sendo enviados corretamente
para o container sem buffering.
"""

import sys
import time
from datetime import datetime

def log_print(message):
    """Função auxiliar para print com flush imediato"""
    print(message, flush=True)
    sys.stdout.flush()

def test_logging():
    """Testa o logging em tempo real"""
    log_print("[TEST] Iniciando teste de logs Python...")
    
    for i in range(10):
        timestamp = datetime.now().strftime('%Y-%m-%d %H:%M:%S.%f')[:-3]
        log_print(f"[{timestamp}] Mensagem de teste #{i+1}")
        time.sleep(1)
    
    log_print("[TEST] Teste de logs concluído!")

if __name__ == "__main__":
    test_logging()
