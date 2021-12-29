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

club = Club.find_or_create_by(name: 'Tymate', owner: cynthia)
club.users = [julien, cynthia, maxime, henri, mbela]

read_session = club.read_sessions.create_with(
  submission_due_date: 6.months.ago,
  read_due_date: 5.months.ago
).find_or_create_by(name: 'Session #1')

read_session.submissions
            .create_with(book: Book.find_by(title: 'Ubik'))
            .find_or_create_by(user: julien)
read_session.submissions
            .create_with(book: Book.find_by(title: 'Le dahlia noir'))
            .find_or_create_by(user: cynthia)
read_session.submissions
            .create_with(book: Book.find_by(title: 'Des fleurs pour Algernon'))
            .find_or_create_by(user: maxime)
read_session.submissions
            .create_with(book: Book.find_by(title: 'Bazaar'))
            .find_or_create_by(user: henri)
read_session.submissions
            .create_with(book: Book.find_or_create_by(title: 'Le monde selon Garp'))
            .find_or_create_by(user: mbela)
read_session.update(selected_book: Book.find_by(title: 'Le dahlia noir'), state: 'archived')

read_session.submissions.find_each do |submission|
  read_session.notes.create_with(value: Note::VALID_NOTES.sample)
              .find_or_create_by(user: submission.user, book: read_session.selected_book)
end

read_session = club.read_sessions.create_with(
  submission_due_date: 5.months.ago,
  read_due_date: 4.months.ago
).find_or_create_by(name: 'Session #2')
read_session.submissions
            .create_with(book: Book.find_by(title: 'Fondation'))
            .find_or_create_by(user: julien)
read_session.submissions
            .create_with(book: Book.find_by(title: 'Le portrait de Dorian Gray'))
            .find_or_create_by(user: cynthia)
read_session.submissions
            .create_with(book: Book.find_by(title: 'Des fleurs pour Algernon'))
            .find_or_create_by(user: maxime)
read_session.submissions
            .create_with(book: Book.find_by(title: "Candide ou l'optimisme"))
            .find_or_create_by(user: henri)
read_session.submissions
            .create_with(book: Book.find_by(title: 'Le monde selon Garp'))
            .find_or_create_by(user: mbela)
read_session.update(selected_book: Book.find_by(title: 'Le portrait de Dorian Gray'), state: 'archived')

read_session.submissions.find_each do |submission|
  read_session.notes.create_with(value: Note::VALID_NOTES.sample)
              .find_or_create_by(user: submission.user, book: read_session.selected_book)
end

read_session = club.read_sessions.create_with(
  submission_due_date: 3.months.ago,
  read_due_date: 2.months.ago
).find_or_create_by(name: 'Session #3')

read_session.submissions
            .create_with(book: Book.find_by(title: 'La chute des géants'))
            .find_or_create_by(user: julien)
read_session.submissions
            .create_with(book: Book.find_by(title: 'Le vol des cygognes'))
            .find_or_create_by(user: cynthia)
read_session.submissions
            .create_with(book: Book.find_by(title: 'Des fleurs pour Algernon'))
            .find_or_create_by(user: maxime)
read_session.submissions
            .create_with(book: Book.find_by(title: 'Orgueil et Préjugés'))
            .find_or_create_by(user: henri)
read_session.submissions
            .create_with(book: Book.find_by(title: 'La Conjuration des imbéciles'))
            .find_or_create_by(user: mbela)
read_session.update(selected_book: Book.find_by(title: 'Le vol des cygognes'), state: 'archived')

read_session.submissions.find_each do |submission|
  read_session.notes.create_with(value: Note::VALID_NOTES.sample)
              .find_or_create_by(user: submission.user, book: read_session.selected_book)
end

ClubUser.find_each(&:refresh_stats)

read_session = club.read_sessions.create_with(
  submission_due_date: Time.zone.now + 1.week,
  read_due_date: Time.zone.now + 1.month
).find_or_create_by(name: 'Session #4')

read_session.submissions
            .create_with(book: Book.find_or_create_by(title: 'La chute des géants'))
            .find_or_create_by(user: julien)
read_session.submissions
            .create_with(book: Book.find_or_create_by(title: 'La Ferme des animaux'))
            .find_or_create_by(user: cynthia)
read_session.submissions
            .create_with(book: Book.find_by(title: 'Des fleurs pour Algernon'))
            .find_or_create_by(user: maxime)
read_session.submissions
            .create_with(book: Book.find_or_create_by(title: 'Les androïdes rêvent-ils de moutons électriques ?'))
            .find_or_create_by(user: henri)
read_session.submissions
            .create_with(book: Book.find_or_create_by(title: 'La Ferme des animaux'))
            .find_or_create_by(user: mbela)
read_session.update(selected_book: Book.find_by(title: 'Les androïdes rêvent-ils de moutons électriques ?'),
                    state: 'reading')
