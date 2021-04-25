<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <title>Pokemones</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <script src="funciones.js"></script>
        <script type="text/javascript">
            fetch('https://pokeapi.co/api/v2/pokemon-species')
                    .then(response => response.json())
                    .then(json => {
                        console.log(json);
                        const list = json.results;
                        var indicadores = '';
                        var items = '';

                        list.forEach((obj, i) => {
                            const arrayStr = obj.url.split('/');
                            console.log(arrayStr)
                            const id = arrayStr[arrayStr.length - 2];
                            const urlImg = 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream-world/' + id + '.svg'
                            const name = capitalize(obj.name);

                            indicadores += '<li data-target="#myCarousel" data-slide-to="0"' + (i === 0 ? ' class="active"' : '') + '></li>'
                            items += '<div class="item' + (i === 0 ? ' active' : '') + '">' +
                                    '<a href="./detalle.jsp?id=' + id + '"><img src="' + urlImg + '" alt="' + name + '" style="height:300px;"></a>' +
                                    '<div class="carousel-caption">' +
                                    '<h3>' + name + '</h3>' +
                                    //'<p>desc</p>' +
                                    '</div>' +
                                    '</div>';
                        });
                        document.getElementById('indicadores').innerHTML = indicadores;
                        document.getElementById('items').innerHTML = items;
                    });
        </script>
    </head>
    <body>
        <div class="container">
            <h2 class="text-center">Pokemones</h2>
            <hr>
            <div class="row">
                <div class="col-sm-3"></div>
                <div class="col-sm-6">
                    <small>*Click sobre la imagen para ver el detalle</small>
                    <div id="myCarousel" class="carousel slide" data-ride="carousel">
                        <!-- Indicators -->
                        <ol class="carousel-indicators" id="indicadores">
                            <!--
                            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                            <li data-target="#myCarousel" data-slide-to="1"></li> -->
                        </ol>
                        <!-- Wrapper for slides -->
                        <div class="carousel-inner" id="items">
                            <!--
                            <div class="item">
                                <img src="https://image.freepik.com/vector-gratis/icono-isometrico-inteligencia-artificial-sala-servidores-centro-datos-concepto-base-datos_39422-772.jpg" alt="Chicago" style="width:100%;">
                                <div class="carousel-caption">
                                    <h3>Chicago</h3>
                                    <p>Thank you, Chicago!</p>
                                </div>
                            </div>
                            -->
                        </div>
                        <!-- Left and right controls -->
                        <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                            <span class="glyphicon glyphicon-chevron-left"></span>
                            <span class="sr-only">Anterior</span>
                        </a>
                        <a class="right carousel-control" href="#myCarousel" data-slide="next">
                            <span class="glyphicon glyphicon-chevron-right"></span>
                            <span class="sr-only">Siguiente</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
