// Barra navegação
const navegacao = document.querySelector("#barra-navegacao");
const footerListas = document.querySelector("#footer");

footerListas.innerHTML = `
    <div class="footer-listas">
        <h1>Roupas</h1>
        <ul>
            <li>Femininas</li>
            <li>Masculinas</li>
            <li>Camisas</li>
            <li>Calças</li>
            <li>Jaquetas</li>
        </ul>
    </div>

    <div class="footer-listas">
        <h1>Sapatos</h1>
        <ul>
            <li>Femininos</li>
            <li>Masculinos</li>
            <li>Social</li>
            <li>Esporte</li>
            <li>Botas</li>
        </ul>
    </div>

    <div class="footer-listas">
        <h1>Óculos</h1>
        <ul>
            <li>Femininos</li>
            <li>Masculinos</li>
            <li>Clássico</li>
            <li>Sol</li>
            <li>Personalizados</li>
        </ul>
    </div>

    <div class="footer-listas">
        <h1>Acessórios</h1>
        <ul>
            <li>Femininos</li>
            <li>Masculinos</li>
            <li>Bonés / Chapeus</li>
            <li>Relógios</li>
            <li>Bolsas</li>
        </ul>
    </div>

    <div class="footer-listas">
        <h1>Fale com a gente!</h1>
        <ul>
            <li><i class="bi bi-whatsapp"></i> 19 91234-5678</li>
            <li><i class="bi bi-telephone"></i> 0800 123 456 789</li>
            <li><i class="bi bi-envelope"></i> contato@rastrourbano.com.br</li>
            <li><i class="bi bi-geo-alt"></i> Americana SP, centro<br />
            rua sete de setembro, 123</li>
        </ul>
    </div>
`