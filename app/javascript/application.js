document.addEventListener("turbo:load", () => {
    document.querySelectorAll(".estrelas").forEach((el) => {
      const nota = parseInt(el.dataset.nota) || 0;
      el.textContent = "★".repeat(nota) + "☆".repeat(5 - nota);
    });

    const busca = document.getElementById("busca");
    if (busca) {
      busca.addEventListener("input", () => {
        const texto = busca.value.toLowerCase();
        document.querySelectorAll(".item").forEach((item) => {
          item.style.display = item.dataset.titulo.includes(texto) ? "" : "none";
        });
      });
    }
  
    const sinopse = document.getElementById("sinopse");
    const contador = document.getElementById("contador");
    if (sinopse && contador) {
      const atualizar = () => (contador.textContent = `${sinopse.value.length}/300`);
      sinopse.addEventListener("input", atualizar);
      atualizar();
    }
  
    const campoUrl = document.getElementById("poster_url");
    const preview = document.getElementById("preview");
    const previewVazio = document.getElementById("preview-vazio");
    if (campoUrl && preview) {
      const mostrar = () => {
        const url = campoUrl.value.trim();
        if (url) {
          preview.src = url;
          preview.style.display = "block";
          previewVazio.style.display = "none";
        } else {
          preview.style.display = "none";
          previewVazio.style.display = "block";
        }
      };
      preview.onerror = () => {
        preview.style.display = "none";
        previewVazio.style.display = "block";
        previewVazio.textContent = "Link inválido";
      };
      campoUrl.addEventListener("input", mostrar);
      mostrar();
    }
  });