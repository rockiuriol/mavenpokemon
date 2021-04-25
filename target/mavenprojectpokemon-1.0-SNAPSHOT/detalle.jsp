<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <title>Detalle Pokemón</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <style>
            .row-sm-flex-center {
                display:flex;
                align-items:center;
            }
        </style>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <script src="funciones.js"></script>
        <script type="text/javascript">
            var url_base = 'https://pokeapi.co/api/v2/pokemon/id/';

            var url_string = window.location.href;
            var url = new URL(url_string);
            var id = url.searchParams.get("id");
            var url_pokemon = frase = url_base.replace("id", id);
            console.log(url_pokemon);
            fetch(url_pokemon)
                    .then(response => response.json())
                    .then(pokeData => {
                        console.log(pokeData);
                        var allPokemonContainer = document.getElementById('poke-container');
                        var pokeName = document.createElement('h2');
                        pokeName.innerText = capitalize(pokeData.name);
                        var pokeNumber = document.createElement('p');
                        pokeNumber.innerText = '#' + pokeData.id;

                        const titleTypes = document.createElement('h3');
                        titleTypes.innerHTML = 'Types';

                        var pokeTypes = document.createElement('ul');
                        createTypes(pokeData.types, pokeTypes);
                        allPokemonContainer.append(pokeName, pokeNumber, titleTypes, pokeTypes);
                        const pokeImage = document.getElementById('poke-image');
                        createPokeImage(pokeData, pokeImage)
                    });

            function createTypes(types, ul) {
                types.forEach(function (type) {
                    let typeLi = document.createElement('li');
                    typeLi.innerText = type['type']['name'];
                    ul.append(typeLi)
                })
            }
            function createPokeImage(pokeData, containerDiv) {
                let pokeImage = document.createElement('img')
                pokeImage.style.height = "400px";
                // https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream-world/
                pokeImage.srcset = pokeData.sprites.other.dream_world.front_default
                containerDiv.appendChild(pokeImage);
            }
        </script>
    </head>
    <body>
        <div class="container" style="margin-top:30px">
            <div class="row row-sm-flex-center">
                <div class="col-sm-4">
                    <div id="poke-container"></div>
                </div>
                <div class="col-sm-8">
                    <div id="poke-image"></div>
                </div>
            </div>
            <a href="./index.jsp">Regresar</a>
        </div>
    </body>
</html>
