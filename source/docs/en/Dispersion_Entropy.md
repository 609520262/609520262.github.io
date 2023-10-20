---
title: Dispersion_Entropy
date: 2023-03-08 22:08:48
---

{% raw %}

   <section data-toggle="wy-nav-shift" class="wy-nav-content-wrap"><nav class="wy-nav-top" aria-label="移动版导航菜单" >
          <i data-toggle="wy-nav-top" class="fa fa-bars"></i>
          <a href="../../index.html">Entropy theory</a>
      </nav>

      <div class="wy-nav-content">
        <div class="rst-content">
          <div role="navigation" aria-label="页面导航">
  <ul class="wy-breadcrumbs">
      <li><a href="../../index.html" class="icon icon-home"></a></li>
      <li class="breadcrumb-item active">Dispersion Entropy</li>
<li class="wy-breadcrumbs-aside">
   <a href="https://github.com/609520262/Deploy-static-content-to-Pages/tree/main/docs/index.rst" class="fa fa-github"> Edit it on GitHub</a>
</li>

  </ul>
  <hr/>
</div>
          <div role="main" class="document" itemscope="itemscope" itemtype="http://schema.org/Article">
           <div itemprop="articleBody">
             
  <section id="dispersion-entropy">
<h1>Dispersion Entropy<a class="headerlink" href="#dispersion-entropy" title="此标题的永久链接"></a></h1>
<section id="id1">
<h2>Basic principle<a class="headerlink" href="#id1" title="此标题的永久链接"></a></h2>
<p>Given a time series <span class="math notranslate nohighlight">\(\left\{ {{x_1},{x_2}, \cdots ,{x_N}} \right\}\)</span>of length <span class="math notranslate nohighlight">\(N\)</span> , the dispersion of entropy calculation steps are as follows:</p>
<ol class="arabic simple">
<li><p>Set <span class="math notranslate nohighlight">\({x_j}\left({j = 1,2, \cdots,N} \right)\)</span> Map to the <span class="math notranslate nohighlight">\(c\)</span> class, And label the class as :math:<cite>1</cite> to <span class="math notranslate nohighlight">\(c\)</span>. To this end, First map <span class="math notranslate nohighlight">\(x\)</span> to <span class="math notranslate using the normal cumulative distribution function (NCDF) Nohighlight > \ "(y = \ left \ {{{y_1}, {y_2}, \ \ cdots, {y_N}} \ right \} \) < / span >, <span class="math notranslate nohighlight">\({y_j}\)</span> is the value of 0-1. Next, We use a linear algorithm to assign each <span class="math notranslate nohighlight">\({y_j}\)</span> from 1 to <span class="math notranslate nohighlight">\(c\)</span> integer. For each element of the mapped signal, Use <span class="math notranslate nohighlight">\(z_j^c = {\rm{round}}\left({c \cdot {y_j} + 0.5} \right)\)</span> The time series after classification is obtained. <span class="math notranslate nohighlight">\(z_j^c\)</span> represents the first of the sorted time series <span class="math notranslate nohighlight">\(j\)</span> an element that increases or decreases <span class="math notranslate nohighlight">\({y_j}\)</span> to an integer class by rounding.</p></li>
<li><p>Embed dimension <span class="math notranslate nohighlight">\(m\)</span> and time delay <span class="math notranslate nohighlight">\(d\)</span> Reconstructed the phase space of <span class="math notranslate nohighlight">\(z_j^c\)</span>, Get <span class="math notranslate nohighlight">\(N - \left({m-1} \right)d\)</span> an embedding vector:</p></li>
</ol>
<div class="math notranslate nohighlight">
\[z_i^{m,c} = \left\{ {z_i^c,z_{i + d}^c, \cdots ,z_{i + \left( {m - 1} \right)d}^c} \right\},i = 1,2, \cdots ,N - \left( {m - 1} \right)d  \tag{1}\]</div>
<div class="admonition important">
<p class="admonition-title">重要</p>
<p>Each embedded vector of the time series <span class="math notranslate nohighlight">\(z_i^{m,c}\)</span> is mapped to a dispersion pattern <span class="math notranslate nohighlight">\({\pi _{{v_0}{v_1} \cdots {v_{m - 1}}}}\)</span>, Where <span class="math notranslate nohighlight">\(z_i^c = {v_0},z_{i + d}^c = {v_1}, + \ \ cdots, z_ {I left ({1} m - \ right) d} ^ c = {v_ {m - 1}} \) < / span >. Because each embedding vector <span class="math notranslate nohighlight">\(z_i^{m,c}\)</span> has <span class="math notranslate nohighlight">\(m\)</span> elements, each of which may be an integer from 1 to <span class="math notranslate nohighlight">\(c\)</span>, So a total of: math: < a href = "# id2" > < span class = "problematic" id = "id3" > ` < / span > < / a > c ^ m} {` possible dispersion model.</p>
</div>
<ol class="arabic simple" start="3">
<li><p>For <span class="math notranslate nohighlight">\({c^m}\)</span> possible dispersion modes, the probability of each dispersion mode is calculated:</p></li>
</ol>
<div class="math notranslate nohighlight">
\[p\left( {{\pi _{{v_0}{v_1} \cdots {v_{m - 1}}}}} \right) = \frac{{{\rm{Number}}\left\{ {i|i \le N - \left( {m - 1} \right)d,z_i^{m,c}{\rm{ has type }}{\pi _{{v_0}{v_1} \cdots {v_{m - 1}}}}} \right\}}}{{N - \left( {m - 1} \right)d}} \tag{2}\]</div>
<div class="admonition important">
<p class="admonition-title">重要</p>
<p><span class="math notranslate nohighlight">\(p\left( {{\pi _{{v_0}{v_1} \cdots {v_{m - 1}}}}} \right)\)</span>said: <span class="math notranslate nohighlight">\(N - \left( {m - 1} \right)d\)</span>  embedding vector <span class="math notranslate nohighlight">\(z_i^{m,c}\)</span> is <span class="math notranslate nohighlight">\({\pi _{{v_0}{v_1} \cdots {v_{m - 1}}}}\)</span> The number of dispersion patterns divided by the total number of embedding vectors <span class="math notranslate nohighlight">\(N - \left( {m - 1} \right)d\)</span> .</p>
</div>
<ol class="arabic simple" start="4">
<li><p>Finally, the dispersion entropy can be calculated as:</p></li>
</ol>
<div class="math notranslate nohighlight">
\[DispEn\left( {x,m,c,d} \right) =  - \sum\limits_{\pi  = 1}^{{c^m}} {p\left( {{\pi _{{v_0}{v_1} \cdots {v_{m - 1}}}}} \right) \cdot \ln p\left( {{\pi _{{v_0}{v_1} \cdots {v_{m - 1}}}}} \right)}     \tag{3}\]</div>
<div class="admonition note">
<p class="admonition-title">备注</p>
<p>Dispersion entropy is proposed by Rostaghi et al. <a class="footnote-reference brackets" href="#id11" id="id4">1</a>, and the suggested parameter selection is as follows:</p>
<ul class="simple">
<li><p>Embedding dimension  <span class="math notranslate nohighlight">\(m = 3\)</span></p></li>
<li><p><span class="math notranslate nohighlight">\(c=6\)</span></p></li>
</ul>
</div>
</section>
<section id="id5">
<h2>Code implementation<a class="headerlink" href="#id5" title="此标题的永久链接"></a></h2>
<p>It is assumed that you have obtained all the code for this project, if you have not obtained the relevant program at this time, please go to <a class="reference internal" href="../install.html"><span class="doc">Installation instructions</span></a></p>
<p>The Dispersion entropy (Dispersion entropy) core program is  <code class="docutils literal notranslate"><span class="pre">MultiDispEn</span></code></p>
<div class="highlight-c++ notranslate"><div class="highlight"><pre><span></span>function [MDE]=MultiDispEn(data,m,nc,tau,scale)

  MDE=[];
  data=data&#39;;
  for j=1:scale
     Xs = Multi(data,j,1);
     [de]=DisEn_NCDF(Xs&#39;,m,nc,tau);
     MDE=[MDE,de];
  end
end
</pre></div>
</div>
<div class="admonition important">
<p class="admonition-title">重要</p>
<p>The information of each input parameter is as follows:</p>
<ul class="simple">
<li><p><code class="docutils literal notranslate"><span class="pre">data</span></code>: The input time series is the column vector</p></li>
<li><p><code class="docutils literal notranslate"><span class="pre">m</span></code> : Embedding dimension</p></li>
<li><p><code class="docutils literal notranslate"><span class="pre">Sym</span></code> : symbol sequence</p></li>
<li><p><code class="docutils literal notranslate"><span class="pre">scale</span></code> : scale ratio</p></li>
</ul>
</div>
</section>
<section id="id6">
<h2>Simulation verification<a class="headerlink" href="#id6" title="此标题的永久链接"></a></h2>
<section id="id7">
<h3>The results of pulse detection of dispersion entropy<a class="headerlink" href="#id7" title="此标题的永久链接"></a></h3>
<figure class="align-center">
<img alt="The results of pulse detection of dispersion entropy" src="/assets/Downloads/单尺度脉冲检测结果/DispEn.emf.svg" />
</figure>
</section>
<section id="id8">
<h3>Visual results of fault classification based on multi-scale dispersion entropy<a class="headerlink" href="#id8" title="此标题的永久链接"></a></h3>
<figure class="align-center">
<img alt="Visual results of fault classification based on multi-scale dispersion entropy" src="/assets/Downloads/多尺度可视化结果/MultiDispEn.emf.svg" />
</figure>
</section>
<section id="id9">
<h3>Noise resistance analysis<a class="headerlink" href="#id9" title="此标题的永久链接"></a></h3>
<figure class="align-center">
<img alt="Noise resistance analysis" src="/assets/Downloads/抗噪性结果/DispEn.emf.svg" />
</figure>
</section>
<section id="id10">
<h3>Computational efficiency result<a class="headerlink" href="#id10" title="此标题的永久链接"></a></h3>
<figure class="align-center">
<img alt="Computational efficiency result" src="/assets/Downloads/计算效率结果/DispEn.emf.svg" />
</figure>
<dl class="footnote brackets">
<dt class="label" id="id11"><span class="brackets"><a class="fn-backref" href="#id4">1</a></span></dt>
<dd><ol class="upperalpha simple" start="13">
<li><p>Rostaghi and H. Azami, “Dispersion Entropy: A Measure for Time-Series Analysis,” IEEE Signal Process. Lett., vol. 23, no. 5, pp. 610–614, May 2016, doi: 10.1109/LSP.2016.2542881.</p></li>
</ol>
</dd>
</dl>
</section>
</section>
</section>


           </div>
          </div>
          <footer><div class="rst-footer-buttons" role="navigation" aria-label="页脚">
        <a href="7%20Symbolic%20dynamic%20Entropy.html" class="btn btn-neutral float-left" title="符号动力学熵(Symbolic dynamic Entropy)" accesskey="p" rel="prev"><span class="fa fa-arrow-circle-left" aria-hidden="true"></span> 上一页</a>
        <a href="../about_us.html" class="btn btn-neutral float-right" title="关于IMLAB" accesskey="n" rel="next">下一页 <span class="fa fa-arrow-circle-right" aria-hidden="true"></span></a>
    </div>

  <hr/>

  
   

</footer>
        </div>
      </div>
    </section>


  {% endraw %}