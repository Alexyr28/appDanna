import 'package:flutter/material.dart';

// COLORES
class AppColors {
  static const Color cream =
      Color(0xFFF0F4F8); // Fondo azul muy claro (casi blanco)
  static const Color darkText = Color(0xFF1A2332); // Texto oscuro azulado
  static const Color accentBlue =
      Color(0xFF2E5B9C); // Azul principal (títulos, acentos)
  static const Color lightBlue = Color(0xFF7BA5D6); // Azul medio (decoraciones)
  static const Color deepBlue = Color(0xFF1B3A5F); // Azul profundo (sombras)
  static const Color skyBlue = Color(0xFFADD8E6);
}

// TEXTOS PERSONALIZABLES
class AppTexts {
  // Home
  static const String welcomeTitle = "Para que nunca olvides";
  static const String welcomeSubtitle = "lo bueno";
  static const String welcomeMessage =
      "Este es un pequeño espacio donde guardé los momentos que nos definieron. "
      "Tómate tu tiempo, recorre cada memoria y recuerda que lo hermoso siempre permanece.";

  // Timeline - Momentos clave
  static const List<TimelineItem> timelineItems = [
    TimelineItem(
      date: "Enero 2025",
      title: "El comienzo",
      description: "Nuestra primera senda juntos",
      imageUrl: "assets/images/enero2025.jpeg",
    ),
    TimelineItem(
      date: "Febrero 2025",
      title: "Nuestra primera foto de calidad",
      description: "La segunda vez con el vestuario juntos.",
      imageUrl: "assets/images/febrero2025.jpeg",
    ),
    TimelineItem(
      date: "Julio 2025",
      title: "El grado",
      description:
          "Que no sea el último baile y el último logro que este presente para ti",
      imageUrl: "assets/images/julio2025.jpeg",
    ),
    TimelineItem(
      date: "Agosto de 2025",
      title: "Nuestra primera salida Juntos",
      description:
          "El dia que me quitaron la moto jaja pero el dia que me sentí más feliz",
      imageUrl: "assets/images/agosto2025.jpeg",
    ),
    TimelineItem(
      date: "Septiembre 2025",
      title: "En tu cumpleaños",
      description:
          "Siempre recordaré tu fecha de cumpleaños y ese día que me incluiste en tu familia",
      imageUrl: "assets/images/septiembre2025.jpeg",
    ),
    TimelineItem(
      date: "Octubre 2025",
      title: "Tu audición",
      description: "Acompañandote en los momentos donde más feliz eres",
      imageUrl: "assets/images/octubre2025.jpeg",
    ),
    TimelineItem(
      date: "Noviembre 2025",
      title: "Como te incluía en mis locuras",
      description: "Y como ellos quieren y te parchabas con ellos",
      imageUrl: "assets/images/nov2025.jpeg",
    ),
    TimelineItem(
      date: "Diciembre 2025",
      title: "Fotaza con beso incluido",
      description:
          "No es la primera foto pero es la que mas me llena el corazón",
      imageUrl: "assets/images/dic2025.jpeg",
    ),
    TimelineItem(
      date: "Enero 2026",
      title: "La última foto",
      description:
          "Cuando te vi de nuevo haciendo tu arte y de lo que me enamoró de ti verte bailar y brillar",
      imageUrl: "assets/images/ene2026.jpeg",
    ),
  ];

  // Playlists
  static const List<PlaylistItem> playlists = [
    PlaylistItem(
      name: "Te encontre",
      description: "Me faltó bailar contigo este tema",
      spotifyUrl:
          "https://open.spotify.com/track/2kP6fOqdSQ5CYqVH5z5844?si=HZVLglyURmGjxirl5Vr8ag",
      emoji: "🔎",
    ),
    PlaylistItem(
      name: "Solo Tú",
      description: "El pensar que ya eras solo Tú",
      spotifyUrl:
          "https://open.spotify.com/track/0TlYqxRfNGgW0PPNim4551?si=u6OddfCoSRmDKFyY5Vrlkg",
      emoji: "🫵🏼",
    ),
    PlaylistItem(
      name: "Todo me gusta de ti",
      description: "Absolutamente todo",
      spotifyUrl:
          "https://open.spotify.com/track/4rh6NUKzdzOenErCBd9AJO?si=TOC4k51QRAu67eglQP0JGw",
      emoji: "✨",
    ),
    PlaylistItem(
      name: "Te juro que te amo",
      description: "La que ultimamente ha sonado en mi cabeza",
      spotifyUrl:
          "https://open.spotify.com/track/2nlxIdcKUF7SMswq2On86n?si=MceAWl5FSh6hibzb9g6cUQ",
      emoji: "❤️",
    ),
  ];

  // La Carta
  static const String letterTitle = "Una carta para ti";
  static const String letterContent = """

Te soy sincero, yo también soy difícil para expresar mis sentimientos, pero contigo me causó un cambio inmenso en mi vida, del cual no me arrepiento de nada. A veces me quedo corto, a veces digo mucho u otras veces no hago nada; sin embargo, lo que siento a veces no se puede explicar con palabras, pero el solo estar ahí… Al escribir esto, créeme que no encuentro las palabras correctas para decir lo que siento, pero aquí estoy tratando de dar lo mejor de mí.

No sé si existe una forma perfecta de decir adiós, pero sé que existe una forma perfecta de recordar. Y quiero que recuerdes esto: fuiste, eres y serás una de las mejores cosas que me ha pasado.

Esta aplicación es una manera de expresar lo que siento y mi forma de agradecerte por llegar a mi vida. No es solo para que sea un simple recuerdo, sino para que sepas lo mucho que fuiste para mí y lo que serás en un futuro.

Gracias por cada momento. Gracias por enseñarme a amar de verdad. Gracias por ser exactamente quien eres. Que jamás se nos pase por la mente que fue una pérdida de tiempo, sino un gracias por aprender el uno del otro.

Donde sea que la vida te lleve, espero que seas inmensamente feliz. Te lo mereces todo y más.

Y recuerda: lo bueno nunca se olvida.

Con todo mi cariño,
Alex

P. D.: Cada vez que escuches alguna de estas canciones, sonríe. Porque así es como quiero que me recuerdes: con una sonrisa.
""";

  static const String letterSignature = "Con cariño, Alex";

  // Navegación
  static const String navHome = "Inicio";
  static const String navTimeline = "Momentos";
  static const String navPlaylists = "Música";
  static const String navLetter = "Carta";
  static const String navWomenDay = "8 de marzo";

  // Día de la Mujer
  static const String womenDayTitle = "Día de la Mujer";
  static const String womenDaySubtitle = "A la mujer que ilumina mi mundo";
  static const String womenDayMessage = """
Hoy celebro a la mujer que fuiste, la que eres y la que estás destinada a ser.

Celebro tu fuerza silenciosa en los días difíciles, tu risa que convierte cualquier momento en un recuerdo hermoso, tu capacidad infinita de cuidar, de soñar y de seguir adelante incluso cuando el mundo pesa demasiado.

Gracias por tu sensibilidad y tu valentía, por tu ternura y tu carácter, por cada pequeño gesto que deja huella sin que te des cuenta. Eres historia, eres presente y eres futuro.

Que nunca olvides lo valiosa que eres, lo mucho que inspiras y lo inmensamente orgulloso que estoy de haber compartido parte del camino contigo.

Feliz Día de la Mujer. Hoy y siempre, mereces todo lo bueno.
""";
}

// MODELOS DE DATOS
class TimelineItem {
  final String date;
  final String title;
  final String description;
  final String imageUrl;

  const TimelineItem({
    required this.date,
    required this.title,
    required this.description,
    required this.imageUrl,
  });
}

class PlaylistItem {
  final String name;
  final String description;
  final String spotifyUrl;
  final String emoji;

  const PlaylistItem({
    required this.name,
    required this.description,
    required this.spotifyUrl,
    required this.emoji,
  });
}
