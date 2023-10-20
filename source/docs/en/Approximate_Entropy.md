---
title: Approximate_Entropy
date: 2023-03-08 21:55:23
---
{% raw %}


<section data-toggle="wy-nav-shift" class="wy-nav-content-wrap"><nav class="wy-nav-top" aria-label="移动版导航菜单" >
          <i data-toggle="wy-nav-top" class="fa fa-bars"></i>
          <a href="../index.html">Entropy theory</a>
      </nav>

      <div class="wy-nav-content">
        <div class="rst-content">
          <div role="navigation" aria-label="页面导航">
  <ul class="wy-breadcrumbs">
      <li><a href="../index.html" class="icon icon-home"></a></li>
      <li class="breadcrumb-item active">Approximate Entropy</li>
<li class="wy-breadcrumbs-aside">
   <a href="https://github.com/609520262/Deploy-static-content-to-Pages/tree/main/docs/index.rst" class="fa fa-github">Edit on GitHub</a>
</li>

  </ul>
  <hr/>
</div>
          <div role="main" class="document" itemscope="itemscope" itemtype="http://schema.org/Article">
           <div itemprop="articleBody">
             
  <section id="approximate-entropy">
<h1>Approximate Entropy<a class="headerlink" href="#approximate-entropy" title="此标题的永久链接"></a></h1>
<section id="id1">
<h2>Basic Principles<a class="headerlink" href="#id1" title="此标题的永久链接"></a></h2>
<p>The given length is <span class="math notranslate nohighlight">\(\left\{ {x\left( i \right),i = 1,2, \cdots ,N} \right\}\)</span> time series <span class="math notranslate nohighlight">\(\left\{ {x\left( i \right),i = 1,2, \cdots ,N} \right\}\)</span> The approximate entropy is calculated as follows:</p>
<ol class="arabic simple">
<li><p>Reconstruct the phase space for <span class="math notranslate nohighlight">\(X\)</span>, The embedding dimension is <span class="math notranslate nohighlight">\(m\)</span>, A sequence of vectors forming the dimension <span class="math notranslate nohighlight">\(m\)</span> :, can be expressed as:</p></li>
</ol>
<div class="math notranslate nohighlight">
\[\left\{ {X\left( 1 \right),X\left( 2 \right), \cdots ,X\left( {N - m + 1} \right)} \right\},X\left( i \right) = \left\{ {x\left( i \right),x\left( {i + 1} \right), \cdots ,x\left( {i + m - 1} \right)} \right\},1 \le i \le N - m + 1 \tag{1}\]</div>
<ol class="arabic simple" start="2">
<li><p>Define <span class="math notranslate nohighlight">\(d\left[{X\left(i \right),X\left(j \right)} \right]\)</span> to be a vector <span class="math notranslate nohighlight">\(X\left(i \right)\)</span> and <span class="math notranslate nohighlight">\(X\left(j \right)\)</span> Chebyshev distance, that is, the maximum of the absolute value of the difference between the corresponding elements of two vectors:</p></li>
</ol>
<div class="math notranslate nohighlight">
\[d\left[ {X\left( i \right),X\left( j \right)} \right] = \mathop {\max }\limits_{k = 0,1, \cdots ,m - 1} \left[ {\left| {x\left( {i + k} \right) - x\left( {j + k} \right)} \right|} \right] \tag{2}\]</div>
<p>For <span class="math notranslate nohighlight">\(X\left(i \right),1 \le i \le N-m + 1\)</span>, We need to compute the <span between it and the remaining vectors <span class="math notranslate nohighlight">\(X\left(j \right),1 \le j \le N,j \ne i\)</span> class="math notranslate nohighlight">\(d\left[{X\left(i \right),X\left(j \right)} \right]\)</span>. So for any <span class="math notranslate nohighlight">\(X\left(i \right)\)</span> there is <span class="math notranslate nohighlight">\(N-m \)</span> a distance.</p>
<ol class="arabic simple" start="3">
<li><p>Given the threshold <span class="math notranslate nohighlight">\(r\)</span>, For all <span class="math notranslate nohighlight">\(X\left(i \right)\)</span>, <span class="math notranslate nohighlight">\(d\left[{X\left(i \right),X\left(j \right)} \right]\)</span <span class="math notranslate nohighlight">\(r\)</span>, Then the ratio of this quantity to the total distance <span class="math notranslate nohighlight">\(N-m \)</span> is denoted as:</p></li>
</ol>
<div class="math notranslate nohighlight">
\[C_i^m\left( r \right) = \frac{{{\rm{number}}\left\{ {i|1 \le i \le N - m + 1,d\left[ {X\left( i \right),X\left( j \right)} \right] &lt; r} \right\}}}{{N - m}} \tag{3}\]</div>
<ol class="arabic simple" start="4">
<li><p>Take logarithm of <span class="math notranslate nohighlight">\(C_i^m\left(r \right)\)</span>, Then compute the mean of all <span class="math notranslate nohighlight">\(N-m + 1\)</span> items, denoted as:</p></li>
</ol>
<div class="math notranslate nohighlight">
\[{\phi ^m}\left( r \right) = \frac{1}{{N - m + 1}}\sum\limits_{i = 1}^{N - m + 1} {\ln C_i^m\left( r \right)} \tag{4}\]</div>
<ol class="arabic simple" start="5">
<li><p>Increase the embedding dimension to <span class="math notranslate nohighlight">\(m + 1\)</span>, repeat steps 1- 4 above, Get <span class="math notranslate nohighlight">\(C_i^{m + 1}\left(r \right)\)</span> and <span class="math notranslate nohighlight">\({\phi ^{m + 1}}\left( r \right)\)</span>.</p></li>
<li><p>In theory, the approximate entropy can be calculated as:</p></li>
</ol>
<div class="math notranslate nohighlight">
\[ApEn\left( {m,r} \right) = \mathop {\lim }\limits_{N \to \infty } \left[ {{\phi ^m}\left( r \right) - {\phi ^{m + 1}}\left( r \right)} \right] \tag{5}\]</div>
<p>Since the actual signal cannot approach infinity, the approximate entropy of a finite sequence is defined as:</p>
<div class="math notranslate nohighlight">
\[ApEn\left( {m,r,N} \right) = {\phi ^m}\left( r \right) - {\phi ^{m + 1}}\left( r \right) \tag{6}\]</div>
<div class="admonition note">
<p class="admonition-title">remark</p>
<p>This is a note admonition.
Approximate entropy was proposed by Pincus<sup>[1]</sup>, and the suggested parameter selection is as follows:</p>
<ul class="simple">
<li><p>Embedded dimension <span class="math notranslate nohighlight">\(m=2\)</span></p></li>
<li><p>Tolerance <span class="math notranslate nohighlight">\(r\)</span> Generally take <cite>0.1~0.2</cite> times the standard deviation (SD) of the time series. For subsequent simulation validation, we select <span class="math notranslate nohighlight">\(r = 0.15 \times {\rm{SD}}\)</span>.</p></li>
</ul>
</div>
</section>
<section id="id2">
<h2>Code implementation<a class="headerlink" href="#id2" title="此标题的永久链接"></a></h2>
<p>It is assumed that you have obtained all the code for this project, if you have not obtained the relevant program at this time, please go to <a class="reference internal" href="install.html"><span class="doc">Installation instructions</span></a></p>
<p>The core procedure for ApproximateEntropy is <strong>ApproximateEntropy</strong></p>
<div class="highlight-sh notranslate"><div class="highlight"><pre><span></span><span class="k">function</span> <span class="nv">AE</span><span class="o">=</span>ApproximateEntropy<span class="o">(</span>data,m,r<span class="o">)</span>  % The input time series data is a column vector
    <span class="nv">AE</span><span class="o">=</span>ApproximateEntropy1<span class="o">(</span>data,m,r<span class="o">)</span><span class="p">;</span>
end
</pre></div>
</div>
</section>
<section id="id3">
<h2>Simulation verification<a class="headerlink" href="#id3" title="此标题的永久链接"></a></h2>
<section id="id4">
<h3>Approximate entropy pulse detection results<a class="headerlink" href="#id4" title="此标题的永久链接"></a></h3>
<figure class="align-center">
<img alt="Approximate entropy pulse detection results" src="../_images/aeClass.png" />
</figure>
</section>
<section id="id5">
<h3>Visual results of fault classification based on multi-scale approximate entropy<a class="headerlink" href="#id5" title="此标题的永久链接"></a></h3>
<figure class="align-center">
<img alt="Visual results of fault classification based on multi-scale approximate entropy" src="../_images/aeEffecience.png" />
</figure>
</section>
</section>
</section>


           </div>
          </div>
          <footer>

  <hr/>

  

</footer>
        </div>
      </div>
    </section>


  {% endraw %}
