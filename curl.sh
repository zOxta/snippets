curl -s -o /dev/null -I -w "HTTP_CODE: %{http_code}\nREDIRECT_URL: %{redirect_url}\n" http://url.com
