# ============================================================
# DOCKERFILE — Pipeline ETL Transport SOTRA (Projet 5)
# ============================================================

FROM python:3.11-slim

# Empêche Python de bufferiser les sorties (utile pour voir les logs en direct)
ENV PYTHONUNBUFFERED=1

WORKDIR /app

# Installer les dépendances Python
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copier le code du projet (notebook, scripts, données)
COPY . .

# Lancer Jupyter par défaut pour pouvoir exécuter le notebook
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]
