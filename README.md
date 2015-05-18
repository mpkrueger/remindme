README
======

This app sends SMS messages via Twilio. Its intended function is to serve as a personal reminder system where the reminders are sent via SMS and don't rely on any particular app.

Integrations used:
- Twilio: SMS messages are sent via Twilio
- Authy: User accounts are created utilizing the user's phone number; Authy is used for two-factor authentication (2FA) of that user's phone number

Gems used:
- Clockwork: scheduled checking of whether any SMS messages are queued up to send
- Bcrypt: encrypting passwords
- Figaro: keeping service passwords out of public repo