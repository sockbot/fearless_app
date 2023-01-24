migrate:
	bin/rails db:migrate

sandbox:
	bin/rails console --sandbox

test:
	bundle exec rspec 