FROM python:3.11-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
CMD ["sh", "-c", "for nb in Notebooks/0*.ipynb; do jupyter nbconvert --to Notebooks --execute --inplace $nb || exit 1; done"]