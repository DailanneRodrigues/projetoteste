<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>D&M - Casamento</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    
    <header>
        <h1>D&M</h1>
        <p>Bem-vindo ao site do casamento de D&M</p>
    </header>

    <main>
        <h2>Envie seu Vídeo</h2>
        <form id="upload-form">
            <input type="file" id="file-input" accept="video/*" required>
            <button type="button" onclick="handleUpload()">Enviar Vídeo</button>
        </form>
        <p id="status"></p>
    </main>
    
    <footer>
        <p>&copy; 2024 D&M - Todos os direitos reservados</p>
    </footer>

    <script>
        function handleUpload() {
            const fileInput = document.getElementById('file-input');
            const status = document.getElementById('status');

            if (fileInput.files.length === 0) {
                alert('Por favor, selecione um arquivo para enviar.');
                return;
            }

            const file = fileInput.files[0];
            const formData = new FormData();
            formData.append('file', file);

            fetch('https://drive.google.com/drive/folders/1hF6vEmRCruhI5Se8b2-Y1jnsPb3l9VbD?usp=sharing', {
                method: 'POST',
                body: formData
            })
            .then(response => response.json())
            .then(result => {
                status.textContent = 'Vídeo enviado com sucesso!';
            })
            .catch(error => {
                status.textContent = 'Erro ao enviar vídeo: ' + error.message;
            });
        }
    </script>
</body>
</html>
