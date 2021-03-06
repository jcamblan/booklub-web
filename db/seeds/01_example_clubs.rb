# frozen_string_literal: true

[
  {
    title: 'Ubik',
    authors: [Author.find_or_create_by(name: 'Philip K Dick')],
    google_book_id: 'SlNIxp0uSR0C'
  },
  {
    title: 'Le dahlia noir',
    authors: [Author.find_or_create_by(name: 'James Ellroy')],
    google_book_id: '7uysBwAAQBAJ'
  },
  {
    title: 'Des fleurs pour Algernon',
    authors: [Author.find_or_create_by(name: 'Daniel Keyes')],
    google_book_id: 'QUo6AAAACAAJ'
  },
  {
    title: 'Bazaar',
    authors: [Author.find_or_create_by(name: 'Stephen King')],
    google_book_id: 'XBUBEAAAQBAJ'
  },
  {
    title: 'Le monde selon Garp',
    authors: [Author.find_or_create_by(name: 'John Irving')],
    google_book_id: 'GKnMucLt5VsC'
  },
  {
    title: 'Fondation',
    authors: [Author.find_or_create_by(name: 'Isaac Asimov')],
    google_book_id: 'TWKQPwAACAAJ'
  },
  {
    title: 'Le portrait de Dorian Gray',
    authors: [Author.find_or_create_by(name: 'Oscar Wilde')],
    google_book_id: 'nxCiBgAAQBAJ'
  },
  {
    title: "Candide ou l'optimisme",
    authors: [Author.find_or_create_by(name: 'Voltaire')],
    google_book_id: 'p1J4fMW0PyoC'
  },
  {
    title: 'La chute des géants',
    authors: [Author.find_or_create_by(name: 'Ken Follet')],
    google_book_id: 'LtWzcQAACAAJ'
  },
  {
    title: 'Le vol des cygognes',
    authors: [Author.find_or_create_by(name: 'Jean Cristophe Grangé')],
    google_book_id: 'fQSvYSesRUAC'
  },
  {
    title: 'Orgueil et Préjugés',
    authors: [Author.find_or_create_by(name: 'Jane Austen')],
    google_book_id: 'C_pSDwAAQBAJ'
  },
  {
    title: 'La Conjuration des imbéciles',
    authors: [Author.find_or_create_by(name: 'John Kennedy Toole')],
    google_book_id: 'q8aXDwAAQBAJ'
  },
  {
    title: 'La Ferme des animaux',
    authors: [Author.find_or_create_by(name: 'George Orwell')],
    google_book_id: 'XDE3ngEACAAJ'
  },
  {
    title: 'Les androïdes rêvent-ils de moutons électriques ?',
    authors: [Author.find_or_create_by(name: 'Philip K. Dick')],
    google_book_id: 'YC4tDwAAQBAJ'
  },
  {
    title: 'Ils étaient Dix',
    authors: [Author.find_or_create_by(name: 'Agatha Christie')],
    google_book_id: 'TS3j8ZTpaG0C'
  },
  {
    title: "Le crépuscule et l'aube",
    authors: [Author.find_or_create_by(name: 'Ken Follet')],
    google_book_id: 'A9zODwAAQBAJ'
  },
  {
    title: 'Ravage',
    authors: [Author.find_or_create_by(name: 'René Barjavel')],
    google_book_id: 'rCgWQgAACAAJ'
  },
  {
    title: '2084 : La fin du monde',
    authors: [Author.find_or_create_by(name: 'Boualem Sansal')],
    google_book_id: 'KNgwDgAAQBAJ'
  },
  {
    title: 'Martin Eden',
    authors: [Author.find_or_create_by(name: 'Jack London')],
    google_book_id: 'MzvnDwAAQBAJ'
  },
  {
    title: 'Marie-Antoinette',
    authors: [Author.find_or_create_by(name: 'Stefan Zweig')],
    google_book_id: 'eEFCAQAACAAJ'
  },
  {
    title: "La promesse de l'aube",
    authors: [Author.find_or_create_by(name: 'Romain Gary')],
    google_book_id: 'QiHQMXVUcFoC'
  },
  {
    title: "L'art subtil de s'en foutre: Un guide à contre-courant pour être soi-même",
    authors: [Author.find_or_create_by(name: 'Mark Manson')],
    google_book_id: 'ag4oDwAAQBAJ'
  },
  {
    title: 'Palimpseste',
    authors: [Author.find_or_create_by(name: 'Charles Stross')],
    google_book_id: 'BL4njwEACAAJ'
  },
  {
    title: "Ne tirez pas sur l'oiseau moqueur",
    authors: [Author.find_or_create_by(name: 'Harper Lee')],
    google_book_id: '-n4gCgAAQBAJ'
  },
  {
    title: 'Survivant des glaces',
    authors: [Author.find_or_create_by(name: 'Mike Horn')],
    google_book_id: 'PwlBEAAAQBAJ'
  },
  {
    title: 'Dark Matter',
    authors: [Author.find_or_create_by(name: 'Blake Crouch')],
    google_book_id: 'hsyeDQAAQBAJ'
  }
].each do |book_attributes|
  Book.create!(book_attributes)
end

julien = User.create_with(username: 'Julien', password: 'password')
             .find_or_create_by(email: 'julien@booklub.app')
cynthia = User.create_with(username: 'Cynthia', password: 'password')
              .find_or_create_by(email: 'cynthia@booklub.app')
maxime = User.create_with(username: 'Maxime', password: 'password')
             .find_or_create_by(email: 'maxime@booklub.app')
henri = User.create_with(username: 'Henri', password: 'password')
            .find_or_create_by(email: 'henri@booklub.app')
mbela = User.create_with(username: 'Mbela', password: 'password')
            .find_or_create_by(email: 'mbela@booklub.app')
sonia = User.create_with(username: 'Sonia', password: 'password')
            .find_or_create_by(email: 'sonia@booklub.app')
esther = User.create_with(username: 'Esther', password: 'password')
             .find_or_create_by(email: 'esther@booklub.app')
christian = User.create_with(username: 'Christian', password: 'password')
                .find_or_create_by(email: 'christian@booklub.app')

club = Club.find_or_create_by(name: 'Tymate', owner: cynthia)
club.users = [julien, cynthia, maxime, henri, mbela, sonia, esther]

read_session = club.read_sessions.create_with(
  submission_due_date: '2020-04-18 19:47:42 UTC',
  read_due_date: '2020-05-18 19:47:42 UTC'
).find_or_create_by(name: 'Session #1')

read_session.submissions
            .create_with(book: Book.find_by(google_book_id: 'SlNIxp0uSR0C'))
            .find_or_create_by(user: julien)
read_session.submissions
            .create_with(book: Book.find_by(google_book_id: '7uysBwAAQBAJ'))
            .find_or_create_by(user: cynthia)
read_session.submissions
            .create_with(book: Book.find_by(google_book_id: 'QUo6AAAACAAJ'))
            .find_or_create_by(user: maxime)
read_session.submissions
            .create_with(book: Book.find_by(google_book_id: 'XBUBEAAAQBAJ'))
            .find_or_create_by(user: henri)
read_session.submissions
            .create_with(book: Book.find_or_create_by(google_book_id: 'GKnMucLt5VsC'))
            .find_or_create_by(user: mbela)
read_session.update(selected_book: Book.find_by(google_book_id: '7uysBwAAQBAJ'), state: 'archived')

read_session = club.read_sessions.create_with(
  submission_due_date: '2020-05-18 19:47:42 UTC',
  read_due_date: '2020-06-18 19:47:42 UTC'
).find_or_create_by(name: 'Session #2')

read_session.submissions
            .create_with(book: Book.find_by(google_book_id: 'TWKQPwAACAAJ'))
            .find_or_create_by(user: julien)
read_session.submissions
            .create_with(book: Book.find_by(google_book_id: 'nxCiBgAAQBAJ'))
            .find_or_create_by(user: cynthia)
read_session.submissions
            .create_with(book: Book.find_by(google_book_id: 'QUo6AAAACAAJ'))
            .find_or_create_by(user: maxime)
read_session.submissions
            .create_with(book: Book.find_by(google_book_id: 'p1J4fMW0PyoC'))
            .find_or_create_by(user: henri)
read_session.submissions
            .create_with(book: Book.find_by(google_book_id: 'GKnMucLt5VsC'))
            .find_or_create_by(user: mbela)
read_session.update(selected_book: Book.find_by(google_book_id: 'nxCiBgAAQBAJ'), state: 'archived')

read_session = club.read_sessions.create_with(
  submission_due_date: '2020-07-18 19:47:42 UTC',
  read_due_date: '2020-08-18 19:47:42 UTC'
).find_or_create_by(name: 'Session #3')

read_session.submissions
            .create_with(book: Book.find_by(google_book_id: 'LtWzcQAACAAJ'))
            .find_or_create_by(user: julien)
read_session.submissions
            .create_with(book: Book.find_by(google_book_id: 'fQSvYSesRUAC'))
            .find_or_create_by(user: cynthia)
read_session.submissions
            .create_with(book: Book.find_by(google_book_id: 'QUo6AAAACAAJ'))
            .find_or_create_by(user: maxime)
read_session.submissions
            .create_with(book: Book.find_by(google_book_id: 'C_pSDwAAQBAJ'))
            .find_or_create_by(user: henri)
read_session.submissions
            .create_with(book: Book.find_by(google_book_id: 'q8aXDwAAQBAJ'))
            .find_or_create_by(user: mbela)
read_session.update(selected_book: Book.find_by(google_book_id: 'fQSvYSesRUAC'), state: 'archived')

read_session = club.read_sessions.create_with(
  submission_due_date: '2020-09-25 19:47:43 UTC',
  read_due_date: '2020-10-18 19:47:43 UTC'
).find_or_create_by(name: 'Session #4')

read_session.submissions
            .create_with(book: Book.find_or_create_by(google_book_id: 'LtWzcQAACAAJ'))
            .find_or_create_by(user: julien)
read_session.submissions
            .create_with(book: Book.find_or_create_by(google_book_id: 'XDE3ngEACAAJ'))
            .find_or_create_by(user: cynthia)
read_session.submissions
            .create_with(book: Book.find_by(google_book_id: 'QUo6AAAACAAJ'))
            .find_or_create_by(user: maxime)
read_session.submissions
            .create_with(book: Book.find_or_create_by(google_book_id: 'YC4tDwAAQBAJ'))
            .find_or_create_by(user: henri)
read_session.submissions
            .create_with(book: Book.find_or_create_by(google_book_id: 'XDE3ngEACAAJ'))
            .find_or_create_by(user: mbela)
read_session.update(selected_book: Book.find_by(google_book_id: 'YC4tDwAAQBAJ'),
                    state: 'archived')

read_session = club.read_sessions.create_with(
  submission_due_date: '2020-11-04 21:28:00 UTC',
  read_due_date: '2020-11-04 21:28:02 UTC',
  ignore_bonus_score: true
).find_or_create_by(name: 'Session #5')

read_session.submissions
            .create_with(book: Book.find_or_create_by(google_book_id: 'TS3j8ZTpaG0C'))
            .find_or_create_by(user: julien)
read_session.submissions
            .create_with(book: Book.find_or_create_by(google_book_id: 'TS3j8ZTpaG0C'))
            .find_or_create_by(user: cynthia)
read_session.submissions
            .create_with(book: Book.find_by(google_book_id: 'TS3j8ZTpaG0C'))
            .find_or_create_by(user: maxime)
read_session.submissions
            .create_with(book: Book.find_or_create_by(google_book_id: 'TS3j8ZTpaG0C'))
            .find_or_create_by(user: henri)
read_session.submissions
            .create_with(book: Book.find_or_create_by(google_book_id: 'TS3j8ZTpaG0C'))
            .find_or_create_by(user: mbela)
read_session.update(selected_book: Book.find_by(google_book_id: 'TS3j8ZTpaG0C'),
                    state: 'archived')

read_session = club.read_sessions.create_with(
  submission_due_date: '2020-11-12 21:30:00',
  read_due_date: '2020-12-11 21:30:00'
).find_or_create_by(name: 'Session #6')

read_session.submissions
            .create_with(book: Book.find_or_create_by(google_book_id: 'LtWzcQAACAAJ'))
            .find_or_create_by(user: julien)
read_session.submissions
            .create_with(book: Book.find_or_create_by(google_book_id: 'LtWzcQAACAAJ'))
            .find_or_create_by(user: cynthia)
read_session.submissions
            .create_with(book: Book.find_by(google_book_id: 'MzvnDwAAQBAJ'))
            .find_or_create_by(user: maxime)
read_session.submissions
            .create_with(book: Book.find_or_create_by(google_book_id: 'A9zODwAAQBAJ'))
            .find_or_create_by(user: henri)
read_session.submissions
            .create_with(book: Book.find_or_create_by(google_book_id: 'rCgWQgAACAAJ'))
            .find_or_create_by(user: mbela)
read_session.submissions
            .create_with(book: Book.find_or_create_by(google_book_id: 'KNgwDgAAQBAJ'))
            .find_or_create_by(user: sonia)
read_session.update(selected_book: Book.find_by(google_book_id: 'A9zODwAAQBAJ'),
                    state: 'archived')

read_session = club.read_sessions.create_with(
  submission_due_date: '2021-08-05 21:30:00',
  read_due_date: '2021-08-11 21:30:00'
).find_or_create_by(name: 'Session #7')

read_session.submissions
            .create_with(book: Book.find_or_create_by(google_book_id: 'QiHQMXVUcFoC'))
            .find_or_create_by(user: esther)
read_session.submissions
            .create_with(book: Book.find_or_create_by(google_book_id: 'eEFCAQAACAAJ'))
            .find_or_create_by(user: cynthia)
read_session.submissions
            .create_with(book: Book.find_or_create_by(google_book_id: 'ag4oDwAAQBAJ'))
            .find_or_create_by(user: henri)
read_session.update(selected_book: Book.find_by(google_book_id: 'QiHQMXVUcFoC'),
                    state: 'archived')

read_session = club.read_sessions.create_with(
  submission_due_date: '2021-12-10 21:30:00',
  read_due_date: '2022-01-15 21:30:00'
).find_or_create_by(name: 'Session #8')

read_session.submissions
            .create_with(book: Book.find_or_create_by(google_book_id: '-n4gCgAAQBAJ'))
            .find_or_create_by(user: esther)
read_session.submissions
            .create_with(book: Book.find_or_create_by(google_book_id: '-n4gCgAAQBAJ'))
            .find_or_create_by(user: cynthia)
read_session.submissions
            .create_with(book: Book.find_or_create_by(google_book_id: 'hsyeDQAAQBAJ'))
            .find_or_create_by(user: henri)
read_session.submissions
            .create_with(book: Book.find_or_create_by(google_book_id: 'BL4njwEACAAJ'))
            .find_or_create_by(user: julien)
read_session.submissions
            .create_with(book: Book.find_or_create_by(google_book_id: 'PwlBEAAAQBAJ'))
            .find_or_create_by(user: christian)
read_session.update(selected_book: Book.find_by(google_book_id: '-n4gCgAAQBAJ'),
                    state: 'reading')

ClubUser.find_each(&:refresh_stats)
