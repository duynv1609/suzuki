<div id="myCarousel" class="carousel slide carousel-fade" data-ride="carousel">
    <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img class="img-fluid" src="{{ asset('images/carousel/fitfood.jpg') }}" alt="Fitfood"/>
        </div>
        <div class="carousel-item">
            <img class="img-fluid" src="{{ asset('images/carousel/eduvest.jpg') }}" alt="Eduvest"/>
        </div>
        <div class="carousel-item">
            <img class="img-fluid" src="{{ asset('images/carousel/suzuki-world.jpg') }}" alt="Suzuki World"/>
        </div>
    </div>
    <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>
