#!/usr/bin/env bash
set -Eeo pipefail
HTTPS=${HTTPS:-false}
GSATIMEOUT=${GSATIMEOUT:-15}

echo "Starting Greenbone Security Assistant..."
#su -c "gsad --verbose --http-only --no-redirect --port=9392" gvm
if [ $HTTPS == "true" ]; then
	su -c "gsad -f --mlisten ovas_gvmd -m 9390 --verbose --timeout=$GSATIMEOUT \
	            --gnutls-priorities=SECURE256:-VERS-TLS-ALL:+VERS-TLS1.2:+VERS-TLS1.3 \
		    --no-redirect \
		    --port=9392" gvm
else
	su -c "gsad -f --mlisten ovas_gvmd -m 9390 --verbose --timeout=$GSATIMEOUT --http-only --no-redirect --port=9392" gvm
fi
tail -f /var/log/gvm/gsad.log 