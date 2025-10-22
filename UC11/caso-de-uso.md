# **Caso de uso: Classificado de Condomínios (“CondoTrade”)**

### **Objetivo**

Permitir que moradores, síndicos e prestadores de serviços de condomínios **comprem, vendam, anunciem e encontrem produtos, serviços e imóveis** em um único portal — funcionando como um “OLX do condomínio”, com anúncios gratuitos e patrocinados.

---

## **Atores**

1. **Usuário visitante (não cadastrado)**

   * Pode **buscar** e **visualizar** anúncios (imóveis, produtos, serviços, vagas etc.).
   * Pode **usar filtros** (categoria, preço, localização, tipo de produto/serviço).
   * Pode **contatar o anunciante** (via formulário, WhatsApp, ou link externo).
   * Pode **ver anúncios patrocinados** com destaque.

2. **Usuário cadastrado (anunciante)**

   * Pode **criar, editar, pausar e excluir** seus anúncios.
   * Pode **escolher tipo de anúncio** (gratuito ou patrocinado).
   * Pode **gerenciar seus anúncios** (estatísticas, destaque, renovação).
   * Possui um **painel de controle** com abas para:

     * Meus anúncios
     * Minhas estatísticas
     * Plano atual / pagamentos
     * Mensagens recebidas

3. **Administrador do sistema**

   * Gerencia **usuários, anúncios e categorias**.
   * Aprova, remove ou destaca anúncios.
   * Controla **planos pagos/patrocínios** e **relatórios financeiros**.
   * Analisa **estatísticas de uso** (quantidade de anúncios, acessos, interações).

---

## **Categorias principais de anúncios**

1. **Imóveis e Vagas**

   * Apartamentos, casas, garagens, quartos, lotes, imóveis para aluguel ou venda.

2. **Produtos (Novos ou Usados)**

   * Eletrodomésticos, móveis, roupas, eletrônicos, perfumes, cosméticos, lingerie etc.

3. **Serviços**

   * Pedreiro, pintor, eletricista, marido de aluguel, diarista, técnico de informática, personal trainer, professores particulares etc.

4. **Automotivo**

   * Vendas e locações de carros, motos e vagas de garagem.

5. **Outros / Desapegos**

   * Itens diversos ou categorias não listadas (doações, trocas, bazar, etc.).

---

## **Fluxo principal (usuário visitante)**

1. O visitante acessa a **página inicial** (`/`).
2. Vê um **campo de busca geral** (ex: “Buscar produtos, serviços ou imóveis no seu condomínio”).
3. Escolhe uma **categoria** ou usa filtros rápidos (imóveis, produtos, serviços).
4. É direcionado à **página de resultados**:

   * Primeiros resultados = **anúncios patrocinados** (com selo de “Destaque”).
   * Em seguida = **anúncios gratuitos**, ordenados por relevância ou data.
5. Pode aplicar filtros específicos por categoria:

   * Imóveis → preço, quartos, tipo, localização.
   * Produtos → preço, condição (novo/usado), tipo.
   * Serviços → tipo, preço médio, localização.
6. Ao clicar em um anúncio, abre a **página de detalhes**, com:

   * Fotos e descrição.
   * Localização (mapa).
   * Contatos do anunciante (WhatsApp, telefone, e-mail).
   * Avaliações (se disponível).

---

## **Fluxo (usuário cadastrado / anunciante)**

1. Faz **login ou cria conta** (via e-mail, celular ou WhatsApp).
2. Acessa o painel **“Meus Anúncios”**.
3. Clica em **“Criar novo anúncio”**, preenche:

   * Categoria (imóvel, produto, serviço etc.).
   * Título e descrição.
   * Preço (ou “a combinar”).
   * Fotos e/ou vídeos.
   * Localização (endereço, condomínio).
   * Escolhe plano: **gratuito** ou **patrocinado**.

     * Se patrocinado → redireciona para pagamento (Pix, cartão, boleto).
4. Após envio:

   * O anúncio é publicado (imediato ou mediante aprovação).
   * Aparece nas buscas (ordem: patrocinado → gratuito).
5. Pode acompanhar **estatísticas** (visualizações, cliques, mensagens recebidas).

---

## **Monetização**

* **Anúncios patrocinados** aparecem:

  * No topo das buscas e categorias.
  * Com selo e borda destacada.
  * Em seções de “Mais vistos do mês” ou “Destaques do condomínio”.
* **Planos pagos / pacotes** incluem:

  * Mais fotos e vídeos.
  * Destaque em destaque na home.
  * Renovação automática.
  * Estatísticas detalhadas.
  * Divulgação em redes sociais do condomínio (opcional).

---

## **Arquitetura de navegação (exemplo)**

```
/                       -> Página inicial (busca global)
/busca                  -> Resultados gerais com filtros
/anuncio/:id            -> Detalhe do anúncio
/categorias             -> Lista de categorias
/login                  -> Login / cadastro
/meus-anuncios          -> Painel do anunciante
/criar-anuncio          -> Criar novo anúncio
/planos                 -> Página de planos pagos
/sobre                  -> Sobre a plataforma
/contato                -> Suporte / Fale conosco
/condominio/:id         -> Página do condomínio (anúncios locais)
```

---

## **Possíveis extensões futuras**

* **Mensagens internas** (chat entre comprador e vendedor).
* **Sistema de reputação** (avaliações de vendedores e prestadores).
* **Favoritar / seguir anúncios ou categorias.**
* **Notificações via WhatsApp e e-mail.**
* **Painel de analytics para anunciantes.**
* **Integração com Google Maps e gateways de pagamento (Pix, Mercado Pago).**
* **Modo “condomínio fechado”** → anúncios visíveis apenas a moradores cadastrados.
* **IA de recomendação** para sugerir produtos ou serviços com base em buscas.