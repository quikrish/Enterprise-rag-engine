up:             ## start local stack
\tdocker compose up -d --build
down:           ## stop local stack
\tdocker compose down
logs:
\tdocker compose logs -f --tail=200
migrate:        ## run initial SQL schema
\tpsql $$DATABASE_URL -f infra/migrations/001_init.sql
lint:
\t( cd services/api-gateway && npm run lint ) && ( cd services/ai-engine && ruff check . )
test:
\t( cd services/api-gateway && npm test ) && ( cd services/ai-engine && pytest -q )
