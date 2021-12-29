import Carousel from "stimulus-carousel"

export default class extends Carousel {
  connect() {
    super.connect()

    // The swiper instance.
    this.swiper

    // Default options for every carousels.
    this.defaultOptions
  }

  // You can set default options in this getter.
  get defaultOptions() {
    return {
      // Default parameters
      slidesPerView: 2,
      spaceBetween: 10,
      speed: 2000,
      // Responsive breakpoints
      breakpoints: {
        // when window width is >= 320px
        320: {
          slidesPerView: 2,
          spaceBetween: 20
        },
        // when window width is >= 480px
        480: {
          slidesPerView: 3,
          spaceBetween: 30
        },
        // when window width is >= 640px
        640: {
          slidesPerView: 4,
          spaceBetween: 40
        },
        // when window width is >= 640px
        820: {
          slidesPerView: 6,
          spaceBetween: 40
        }
      },
      autoplay: true,
    }
  }
}