from pydantic_settings import BaseSettings

class Settings(BaseSettings):
    APP_NAME: str = "ProvadorIA API"
    DATABASE_URL: str = "postgresql://user:pass@localhost/provadoria"
    GEMINI_API_KEY: str = ""
    JWT_SECRET: str = "change-me"
    JWT_ALGORITHM: str = "HS256"
    ACCESS_TOKEN_EXPIRE_MINUTES: int = 60 * 24 * 7

    class Config:
        env_file = ".env"

settings = Settings()
