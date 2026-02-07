FROM python:3.10-slim

WORKDIR /app

# Установка зависимостей
COPY pyproject.toml ./
RUN pip install --no-cache-dir .[dev]

# Копирование исходного кода
COPY src/ ./src/
COPY configs/ ./configs/

# Создание необходимых директорий
RUN mkdir -p storage/cache storage/outputs storage/temp logs

# Запуск приложения
CMD ["uvicorn", "infrastructure.web.main:app", "--host", "0.0.0.0", "--port", "8000"]
