(in-package #:lispotify)

(export '(search-track))

(defun search-track (name)
  (with-token
    (let* ((uri (concatenate 'string
                             "https://api.spotify.com/v1/search?q="
                             (quri:url-encode name)
                             "&type=track"))
           (raw-results (dex:get uri
                                 :headers `(("Authorization" . ,*access-token*)))))
      (val (val (parse raw-results) "tracks") "items"))))
