# **Caso de uso: Classificado de Condomínios (“CondoTrade”)**

### **Objetivo**

Permitir que usuários busquem, anunciem e encontrem imóveis (condomínios, apartamentos, lotes ou unidades) em um portal especializado, com anúncios gratuitos e patrocinados.

---

## **Atores**

1. **Usuário visitante (não cadastrado)**

   * Pode **buscar** e **visualizar** anúncios.
   * Pode **usar filtros** (localização, preço, tipo, etc.).
   * Pode clicar em **anúncios patrocinados** e **contatar o anunciante** (por formulário ou link externo).

2. **Usuário cadastrado (anunciante)**

   * Pode **criar, editar e excluir** anúncios.
   * Pode **escolher tipo de anúncio** (gratuito ou patrocinado).
   * Pode **gerenciar seus anúncios** (estatísticas, destaque, renovação).
   * Tem **painel de controle** com seus anúncios ativos/inativos.

3. **Administrador do sistema**

   * Gerencia **usuários e anúncios**.
   * Aprova, remove ou destaca anúncios.
   * Controla **planos pagos/patrocínio**.
   * Visualiza **relatórios de receita e tráfego**.

---

## **Fluxo principal (usuário visitante)**

1. O visitante acessa a **página inicial** (`/`).
2. Vê um **campo de busca principal** (ex: “Buscar condomínio por cidade, bairro ou nome”).
3. Ao pesquisar, é direcionado para uma **página de resultados**:

   * Primeiros resultados = **anúncios patrocinados** (exibidos com selo “Destaque”).
   * Depois, **anúncios gratuitos**, ordenados por relevância ou data.
4. Pode aplicar **filtros** (preço, número de quartos, tipo, localização).
5. Ao clicar em um anúncio, abre a **página de detalhes**, com fotos, descrição, contato do anunciante e localização no mapa.

---

## **Fluxo (usuário cadastrado)**

1. Usuário faz **login ou cria conta**.
2. Acessa o **painel “Meus Anúncios”**.
3. Clica em **“Criar novo anúncio”** e preenche:

   * Título
   * Descrição
   * Tipo de imóvel
   * Localização
   * Fotos
   * Valor
   * Escolhe plano: **gratuito** ou **patrocinado**

     * Se patrocinado → redireciona para pagamento (ex: cartão, Pix, etc.)
4. Após envio, o anúncio é publicado e aparece nas buscas (respeitando a ordem patrocinado → gratuito).

---

## **Monetização**

* **Anúncios patrocinados** aparecem:

  * No topo das buscas.
  * Com destaque visual (selo, borda colorida, etc.).
  * Eventualmente em seções de “Destaques da semana”.
* **Pacotes pagos** podem incluir:

  * Mais fotos.
  * Destaque na home.
  * Duração estendida.

---

## **Arquitetura de navegação (exemplo)**

```
/                -> Página inicial (busca)
/busca           -> Resultados com filtros e ordenação
/anuncio/:id     -> Detalhe do anúncio
/login           -> Login/cadastro
/meus-anuncios   -> Painel do anunciante
/criar-anuncio   -> Formulário de criação
/planos          -> Página de planos pagos
/sobre           -> Sobre a plataforma
/contato         -> Contato/Suporte
```

---

## **Possíveis extensões futuras**

* Sistema de **mensagens internas** entre anunciante e interessado.
* **Favoritar** anúncios.
* Integração com **Google Maps**.
* **Painel de analytics** para anunciantes (visualizações, contatos recebidos).
* **Notificações** por e-mail ou WhatsApp.
* **Integração com gateway de pagamento** (ex: Stripe, Mercado Pago).