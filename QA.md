# ProvadorIA — QA Checklist

## Funcionalidades Core

### Onboarding
- [ ] App abre mostrando onboarding na primeira vez
- [ ] 3 telas com swipe ou botão "Próximo"
- [ ] Botão "Começar" na última tela leva ao app
- [ ] Onboarding não aparece novamente após "Começar"

### Autenticação
- [ ] App obtém token JWT anônimo automaticamente
- [ ] Token é válido por 30 dias
- [ ] Requisições autenticadas funcionam

### Home
- [ ] Header com branding renderiza
- [ ] Quick actions navegam corretamente
- [ ] Stats cards carregam dados reais do feed
- [ ] Tendências carregam do backend
- [ ] Empty state quando feed vazio
- [ ] Error state em falha de rede

### Try-On
- [ ] Photo picker para foto do usuário funciona
- [ ] Photo picker para foto da roupa funciona
- [ ] Step indicator atualiza conforme progresso
- [ ] TextEditor aceite descrição
- [ ] Botão gerar fica disabled até formulário válido
- [ ] Loading state durante geração
- [ ] Resultado mostra descrição, fit assessment, dicas, ocasiões
- [ ] Share sheet funciona
- [ ] Reviews aparecem no resultado

### Feed
- [ ] Feed carrega try-ons do backend
- [ ] Pull-to-refresh funciona
- [ ] Empty state aparece quando vazio
- [ ] Error state aparece em falha
- [ ] Vote button incrementa votos
- [ ] Reviews navegam para ReviewsView

### Reviews
- [ ] Reviews carregam para um try-on específico
- [ ] Rating médio calculado corretamente
- [ ] Criar review funciona (se implementado)

### Perfil
- [ ] Stats do usuário renderizam
- [ ] **Account Deletion**: Botão excluir → confirmação → conta deletada → volta para onboarding

## Testes de API (Backend)

```bash
cd backend
pytest tests/test_e2e.py -v
```

Endpoints testados:
- POST /api/v1/auth/anonymous
- POST /api/v1/tryon/generate
- GET /api/v1/tryon/feed
- POST /api/v1/tryon/vote
- POST /api/v1/reviews
- GET /api/v1/reviews/{tryon_id}
- DELETE /api/v1/users/me

## Testes de UI (iOS)

```bash
cd ios
xcodebuild test -project ProvadorIA.xcodeproj -scheme ProvadorIA -destination 'platform=iOS Simulator,name=iPhone 16 Pro'
```

## Performance
- [ ] App inicia em < 3 segundos
- [ ] Generate try-on responde em < 5 segundos
- [ ] Feed carrega em < 2 segundos
- [ ] Scroll é fluido (60fps)

## Acessibilidade
- [ ] VoiceOver lê todos os elementos
- [ ] Contraste de cores adequado
- [ ] Tamanhos de fonte dinâmicos suportados

## Compatibilidade
- [ ] iOS 18.0+
- [ ] iPhone 14, 15, 16 (todos os tamanhos)
- [ ] Modo escuro
