// ============================================================================
// PROVADORIA - App Store Connect Finalização Manual (Console Script)
// ============================================================================
// Instruções:
// 1. Certifique-se de estar logado no App Store Connect no Chrome
// 2. Navegue para: https://appstoreconnect.apple.com/apps/6770621817/appstore
// 3. Abra o Console do Developer Tools (F12 > Console)
// 4. Cole este script inteiro e pressione Enter
// 5. Aguarde as mensagens de progresso
// ============================================================================

(function() {
    'use strict';
    
    const APP_ID = '6770621817';
    const DELAY = (ms) => new Promise(r => setTimeout(r, ms));
    
    function log(msg) {
        console.log(`[ProvadorIA] ${msg}`);
    }
    
    function findButton(texts) {
        const buttons = Array.from(document.querySelectorAll('button, [role="button"], .button, .action-button'));
        for (const btn of buttons) {
            const txt = (btn.textContent || btn.innerText || btn.value || '').trim().toLowerCase();
            for (const t of texts) {
                if (txt.includes(t.toLowerCase())) return btn;
            }
        }
        return null;
    }
    
    function findElementByText(text, tag = '*') {
        const els = Array.from(document.querySelectorAll(tag));
        return els.find(el => (el.textContent || '').trim() === text);
    }
    
    // =========================================================================
    // STEP 1: Pricing
    // =========================================================================
    async function configurePricing() {
        log('=== STEP 1: Pricing ===');
        window.location.href = `https://appstoreconnect.apple.com/apps/${APP_ID}/appstore/pricing`;
        await DELAY(4000);
        
        const addBtn = findButton(['Adicionar preços', 'Add Pricing', 'Pricing']);
        if (addBtn) {
            log('Botão "Adicionar preços" encontrado. Clicando...');
            addBtn.click();
            await DELAY(2000);
            
            const freeOpt = findElementByText('Free');
            if (freeOpt) {
                log('Opção "Free" encontrada. Clicando...');
                freeOpt.click();
                await DELAY(1000);
                
                const saveBtn = findButton(['Adicionar', 'Salvar', 'Save', 'Add']);
                if (saveBtn) {
                    log('Botão salvar encontrado. Clicando...');
                    saveBtn.click();
                    await DELAY(2000);
                    log('✅ Pricing configurado como Free!');
                    return true;
                }
            }
        } else {
            log('⚠️ Botão "Adicionar preços" NÃO encontrado. Pode já estar configurado.');
        }
        return false;
    }
    
    // =========================================================================
    // STEP 2: App Privacy
    // =========================================================================
    async function configureAppPrivacy() {
        log('=== STEP 2: App Privacy ===');
        window.location.href = `https://appstoreconnect.apple.com/apps/${APP_ID}/appstore/appprivacy`;
        await DELAY(4000);
        
        const getStarted = findButton(['Get Started', 'Começar', 'Start']);
        if (getStarted) {
            log('Botão "Get Started" encontrado. Clicando...');
            getStarted.click();
            await DELAY(3000);
            
            // Try to find and click "Publish" or "Publicar"
            const publishBtn = findButton(['Publish', 'Publicar']);
            if (publishBtn) {
                log('Botão "Publish" encontrado. Clicando...');
                publishBtn.click();
                await DELAY(2000);
                log('✅ App Privacy publicado!');
                return true;
            }
        } else {
            log('⚠️ Botão "Get Started" NÃO encontrado. Pode já estar publicado.');
        }
        return false;
    }
    
    // =========================================================================
    // STEP 3: Submit for Review
    // =========================================================================
    async function submitForReview() {
        log('=== STEP 3: Submit for Review ===');
        window.location.href = `https://appstoreconnect.apple.com/apps/${APP_ID}/appstore`;
        await DELAY(4000);
        
        const addReviewBtn = findButton(['Adicionar para revisão', 'Add for Review', 'Submit for Review']);
        if (addReviewBtn) {
            log('Botão "Adicionar para revisão" encontrado! Clicando...');
            addReviewBtn.click();
            await DELAY(3000);
            
            // Look for confirmation/submit button in modal
            const submitBtn = findButton(['Submit', 'Submeter', 'Enviar', 'Confirm']);
            if (submitBtn) {
                log('Botão de confirmação encontrado. Clicando...');
                submitBtn.click();
                await DELAY(3000);
                log('🎉 APP ENVIADO PARA REVISÃO! 🎉');
                return true;
            } else {
                log('⚠️ Botão de confirmação não encontrado. Verifique o modal manualmente.');
            }
        } else {
            log('❌ Botão "Adicionar para revisão" NÃO encontrado.');
            log('Possíveis razões:');
            log('  - Build 5 ainda não está associado à versão 1.0');
            log('  - Pricing ainda não configurado');
            log('  - App Privacy ainda não publicado');
            log('  - Há avisos/erros de validação na página');
        }
        return false;
    }
    
    // =========================================================================
    // MAIN
    // =========================================================================
    async function main() {
        log('Iniciando automação manual do App Store Connect...');
        log('App: ProvadorIA (6770621817)');
        log('Build: 1.0 (5)');
        log('');
        
        await configurePricing();
        await DELAY(2000);
        
        await configureAppPrivacy();
        await DELAY(2000);
        
        await submitForReview();
        
        log('');
        log('=== Automação concluída ===');
        log('Verifique se há mensagens de sucesso acima.');
        log('Se houver erros, verifique manualmente cada seção no ASC.');
    }
    
    main().catch(e => log('Erro: ' + e.message));
})();
