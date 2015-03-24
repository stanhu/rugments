Changelog
=========

Rugments 1.0.0 (2015-XX-XX)
---------------------------

Misc
^^^^

* Initial fork from rouge_
* Minimum ruby is now 2.0.0
* Provide documentation using sphinx
* Provide continuous integration support using travis_ and coveralls_
* Replace AUTHORS with a generated list from git (:doc:`authors`)


Fixes
^^^^^

* Huge code cleanup (:commit:`1dc93d6`, :compare:`a59f598...581dec4`)
* Improve diff lexer, fixes :issue:`10` (:commit:`0dbae4b`)
* Ignore case when filtering lexers against filenames (:commit:`43f186b`)
* Do not add extra lines for non-newline-terminated strings (:commit:`5f03431`)
* Matlab: Don't fail on something like ``var = [0 0 0 0]';`` (:compare:`ba92d33...c66285a`)
* SASS/SCSS: Recognize @each, @return, @media, @function keywords (:commit:`857dcf1`)
* C++: Add arduino file mappings (:commit:`79cfd51`)
* JSON: Object keys are name tags, rather than strings (:commit:`72964e7`)
* ObjectiveC: Add support for lexing array literals (:commit:`c8b2574`)
* Swift: Add @noescape, @autoclosure(escaping) attributes (:commit:`d5392fb`)
* Swift: add @objc_block attribute; fix end-of-file comments (:commit:`b6255be`)
* Slim: Several improvements (:compare:`6949dd8...770e46a`)
* Liquid: New lexer (:compare:`c097c68...3e8a1b0`)


Enhancements
^^^^^^^^^^^^

* Support Drupal filename extensions, fixes :issue:`5` (:commit:`779c8d3`)

* New HTML formatter (among others :commit:`73bfa5d`, :commit:`659cbc8`)

  * Changed ``wrap`` to ``nowrap`` which is ``false`` by default
  * Ported ``linenos``, ``linenostart``, ``lineanchors`` and ``anchorlinenos``
    from pygments
  * Added ``lineanchorsid`` to be able to change the url fragment

* Use a cache for all the lexers. Guessing lexers is up to twice as fast!
  If you just want to use one lexer, rugments does not have to load the whole
  bunch of provided lexers. Use ``Rugments::Lexer.find_by_name`` to get a
  particular lexer class.


.. _rouge: https://github.com/jneen/rouge
.. _travis: https://travis-ci.org/rumpelsepp/rugments
.. _coveralls: https://coveralls.io/r/rumpelsepp/rugments
