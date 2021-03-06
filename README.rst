pandoc-unfragment
=================

A simple pandoc-filter for writing beamer presentations alongside reveal.js
---------------------------------------------------------------------------

Writing *pandoc* projects with ``beamer`` and ``revealjs`` as output
formats, one sometimes runs into the problem that *pandoc* does not know
where a block should start and end. This is especially important for
pauses or fragments ``. . .``. Enclosing the block in a ``<div>`` solves
the problem for ``revealjs`` but breaks ``beamer``. That's why I created
this simple *pandoc* filter, unwrapping blocks that are handeled fine by
*LaTeX*.

Example
-------

::

    ## Periodic Groups

    ### Definition

    A group $G$ is called *periodic* if for each element $a \in G$ there exists an integer $n > 0$ such that
    $$a^n = e.$$

    . . .

    <div fragment="true">
    ### Examples

     * Every finite group is periodic.
     * The direct product of cyclic groups
       $$ \bigoplus_{i=2}^\infty \Z_i $$
       is periodic.
    </div>

produces valid output using ``revealjs`` and gets transformed to

::

    ## Periodic Groups

    ### Definition

    A group $G$ is called *periodic* if for each element $a \in G$ there exists an integer $n > 0$ such that
    $$a^n = e.$$

    . . .

    ### Examples

     * Every finite group is periodic.
     * The direct product of cyclic groups
       $$ \bigoplus_{i=2}^\infty \Z_i $$
       is periodic.

for usage with ``beamer``. Note, that actually ``revealjs`` just needs a ``<div>`` and ignores the ``fragment`` attribute.
