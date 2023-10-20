---
title: Sample_entropy
date: 2023-03-08 22:03:41
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
      <li class="breadcrumb-item active">Sample entropy</li>
<li class="wy-breadcrumbs-aside">
   <a href="https://github.com/609520262/Deploy-static-content-to-Pages/tree/main/docs/index.rst" class="fa fa-github"> 在 GitHub 上编辑</a>
</li>

  </ul>
  <hr/>
</div>
          <div role="main" class="document" itemscope="itemscope" itemtype="http://schema.org/Article">
           <div itemprop="articleBody">
             
  <section id="sample-entropy">
<h1>Sample entropy<a class="headerlink" href="#sample-entropy" title="此标题的永久链接"></a></h1>
<section id="id1">
<h2>Basic principle<a class="headerlink" href="#id1" title="此标题的永久链接"></a></h2>
<p>Has a time series <span class="math notranslate nohighlight">\(X = \left\{{x\left(1 \right),x\left(2 \right), \cdots,x\left(N \right)} \right\}\)</span>of length <span class="math notranslate nohighlight">\(N\)</span> , the sample entropy is calculated as follows:</p>
<ol class="arabic simple">
<li><p>Reconstructs the phase space from the time series <span class="math notranslate nohighlight">\(X\)</span>, Form the sequence of vectors <span class="math notranslate nohighlight">\(\left\{ {{x_m}\left( 1 \right),{x_m}\left( 2 \right), \cdots ,{x_m}\left( {N - m + 1} \right)} \right\}\)</span>, The embedded dimension is the dimension of the vector <span class="math notranslate nohighlight">\(m\)</span>, where:</p></li>
</ol>
<div class="math notranslate nohighlight">
\[{x_m}\left( i \right) = \left\{ {x\left( i \right),x\left( {i + 1} \right), \cdots ,x\left( {i + m - 1} \right)} \right\},1 \le i \le N - m + 1 \tag{1}\]</div>
<ol class="arabic simple" start="2">
<li><p>Define distance <span class="math notranslate nohighlight">\(d\left[{{x_m}\left(i \right),{x_m}\left(j \right)} \right]\)</span> is the vector <span class="math notranslate nohighlight">\({x_m}\left(i \right)\)</span> and <span class="math notranslate nohighlight">\({x_m}\left(j \right)\)</span> The maximum value of the absolute difference of the corresponding element, that is, the Chebyshev distance:</p></li>
</ol>
<div class="math notranslate nohighlight">
\[d\left[ {{x_m}\left( i \right),{x_m}\left( j \right)} \right] = \mathop {\max }\limits_{k = 0, \cdots ,m - 1} \left( {\left| {x\left( {i + k} \right) - x\left( {j + k} \right)} \right|} \right) \tag{2}\]</div>
<ol class="arabic simple" start="3">
<li><p>Given tolerance <span class="math notranslate nohighlight">\(r\)</span>, For the fixed <span class="math notranslate nohighlight">\({x_m}\left(i \right)\)</span>, The distance between it and <span class="math notranslate nohighlight">\({x_m}\left(j \right)\)</span> satisfies  <span class="math notranslate nohighlight">\(d\left[ {{x_m}\left( i \right),{x_m}\left( j \right)} \right] \le r,j \ne i\)</span> The number of distances is denoted as <span class="math notranslate nohighlight">\({B_i}\)</span>, The total distance is <span class="math notranslate nohighlight">\(N-m \)</span>, defined as:</p></li>
</ol>
<div class="math notranslate nohighlight">
\[B_i^m\left( r \right) = \frac{1}{{N - m}}{B_i} \tag{3}\]</div>
<ol class="arabic simple" start="4">
<li><p>对  <span class="math notranslate nohighlight">\(1 \le i \le N - m + 1\)</span>，Define <span class="math notranslate nohighlight">\({B^m}\left(r \right)\)</span> as</p></li>
</ol>
<div class="math notranslate nohighlight">
\[{B^m}\left( r \right) = \frac{1}{{N - m + 1}}\sum\limits_{i = 1}^{N - m + 1} {B_i^m\left( r \right)}  \tag{4}\]</div>
<ol class="arabic simple" start="5">
<li><p>Increase the dimension <span class="math notranslate nohighlight">\(m\)</span> to <span class="math notranslate nohighlight">\(m+1\)</span>, repeat above (Step 1- Step 4), Get <span class="math notranslate nohighlight">\({B^{m + 1}}\left(r \right)\)</span></p></li>
<li><p>Sample entropy can be defined as:</p></li>
</ol>
<div class="math notranslate nohighlight">
\[SampEn\left( {m,r} \right) = \mathop {\lim }\limits_{N \to \infty } \left\{ { - \ln \left[ {\frac{{{B^{m + 1}}\left( r \right)}}{{{B^m}\left( r \right)}}} \right]} \right\} \tag{5}\]</div>
<p>Since <span class="math notranslate nohighlight">\(N\)</span> of the actual signal cannot approach infinity, the sample entropy of a finite sequence is defined as:</p>
<div class="math notranslate nohighlight">
\[SampEn\left( {m,r,N} \right) =  - \ln \left[ {\frac{{{B^{m + 1}}\left( r \right)}}{{{B^m}\left( r \right)}}} \right] \tag{6}\]</div>
<div class="admonition note">
<p class="admonition-title">remark</p>
<dl class="simple">
<dt>This is a note admonition.</dt><dd><p>Sample entropy is proposed by Richman et al. <a class="footnote-reference brackets" href="#id9" id="id2">1</a>, and the suggested parameter selection is as follows:</p>
</dd>
</dl>
<ul class="simple">
<li><p>Embedded dimension <span class="math notranslate nohighlight">\(m=2\)</span></p></li>
<li><p>Tolerance <span class="math notranslate nohighlight">\(r\)</span> Generally take <cite>0.1~0.25</cite> times the standard deviation (SD) of the time series. In the subsequent simulation verification, We select <span class="math notranslate nohighlight">\(m=2\)</span>, <span class="math notranslate nohighlight">\(r = 0.15 \times {\rm{SD}}\)</span>.</p></li>
</ul>
</div>
</section>
<section id="id3">
<h2>Code implementation<a class="headerlink" href="#id3" title="此标题的永久链接"></a></h2>
<p>It is assumed that you have obtained all the code for this project, if you have not obtained the relevant program at this time, please go to  <a class="reference internal" href="../install.html"><span class="doc">Installation instructions</span></a></p>
<p>The core program of Sample entropy is<code class="docutils literal notranslate"><span class="pre">ApproximateEntropy</span></code></p>
<div class="highlight-sh notranslate"><div class="highlight"><pre><span></span> <span class="k">function</span> <span class="nv">SE</span><span class="o">=</span>SampleEntropy<span class="o">(</span>data,m,r<span class="o">)</span>  % 输入的时间序列data为列向量即可
   <span class="nv">SE</span><span class="o">=</span>SampleEntropy1<span class="o">(</span>data,m,r<span class="o">)</span><span class="p">;</span>
end
</pre></div>
</div>
<div class="admonition important">
<p class="admonition-title">重要</p>
<p>The information of each input parameter is as follows:</p>
<ul class="simple">
<li><p><code class="docutils literal notranslate"><span class="pre">data</span></code>：The input time series is a column vector</p></li>
<li><p><code class="docutils literal notranslate"><span class="pre">r</span></code>  : tolerance</p></li>
<li><p><code class="docutils literal notranslate"><span class="pre">m</span></code> : Embedding dimension</p></li>
</ul>
</div>
</section>
<section id="id4">
<h2>Simulation verification<a class="headerlink" href="#id4" title="此标题的永久链接"></a></h2>
<section id="id5">
<h3>Pulse detection results of sample entropy<a class="headerlink" href="#id5" title="此标题的永久链接"></a></h3>
<figure class="align-center">
<img alt="Pulse detection results of sample entropy" src="/assets/Downloads/单尺度脉冲检测结果/SE.emf.svg" />
</figure>
</section>
<section id="id6">
<h3>Visualization results of fault classification based on multi-scale sample entropy<a class="headerlink" href="#id6" title="此标题的永久链接"></a></h3>
<figure class="align-center">
<img alt="Visualization results of fault classification based on multi-scale sample entropy" src="/assets/Downloads/多尺度可视化结果/MultiSE.emf.svg" />
</figure>
</section>
<section id="id7">
<h3>Noise resistance analysis<a class="headerlink" href="#id7" title="此标题的永久链接"></a></h3>
<figure class="align-center">
<img alt="Noise resistance analysis" src="/assets/Downloads/抗噪性结果/SE.emf.svg" />
</figure>
</section>
<section id="id8">
<h3>Computational efficiency result<a class="headerlink" href="#id8" title="此标题的永久链接"></a></h3>
<figure class="align-center">
<img alt="Computational efficiency result" src="/assets/Downloads/计算效率结果/SE.emf.svg" />
</figure>
<dl class="footnote brackets">
<dt class="label" id="id9"><span class="brackets"><a class="fn-backref" href="#id2">1</a></span></dt>
<dd><ol class="upperalpha simple" start="10">
<li><ol class="upperalpha simple" start="19">
<li><p>Richman and J. R. Moorman, “Physiological time-series analysis using approximate entropy and sample entropy,” Am. J. Physiol.-Heart Circ. Physiol., vol. 278, no. 6, pp. H2039–H2049, Jun. 2000, doi: 10.1152/ajpheart.2000.278.6.H2039.</p></li>
</ol>
</li>
</ol>
</dd>
</dl>
</section>
</section>
</section>


           </div>
          </div>
          <footer><div class="rst-footer-buttons" role="navigation" aria-label="页脚">
        <a href="1%20Approximate%20Entropy.html" class="btn btn-neutral float-left" title="近似熵(Approximate Entropy)" accesskey="p" rel="prev"><span class="fa fa-arrow-circle-left" aria-hidden="true"></span> 上一页</a>
        <a href="3%20Fuzzy%20entropy.html" class="btn btn-neutral float-right" title="模糊熵(Fuzzy entropy)" accesskey="n" rel="next">下一页 <span class="fa fa-arrow-circle-right" aria-hidden="true"></span></a>
    </div>

  <hr/>

  
   

</footer>
        </div>
      </div>
    </section>


  {% endraw %}
