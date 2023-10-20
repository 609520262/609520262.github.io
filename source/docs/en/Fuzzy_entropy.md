---
title: Fuzzy_entropy
date: 2023-03-08 22:04:30
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
      <li class="breadcrumb-item active">Fuzzy entropy</li>
<li class="wy-breadcrumbs-aside">
   <a href="https://github.com/609520262/Deploy-static-content-to-Pages/tree/main/docs/index.rst" class="fa fa-github">Edit it on GitHub</a>
</li>

  </ul>
  <hr/>
</div>
          <div role="main" class="document" itemscope="itemscope" itemtype="http://schema.org/Article">
           <div itemprop="articleBody">
             
  <section id="fuzzy-entropy">
<h1>Fuzzy entropy<a class="headerlink" href="#fuzzy-entropy" title="此标题的永久链接"></a></h1>
<section id="id1">
<h2>Basic principle<a class="headerlink" href="#id1" title="此标题的永久链接"></a></h2>
<p>Fuzzy entropy is obtained by introducing a fuzzy membership function based on sample entropy. Has a time series <span class="math notranslate nohighlight">\(X = \left\{{x\left(1 \right),x\left(2 \right), \cdots,x\left(N \right)} \right\}\)</span> of length <span class="math notranslate nohighlight">\(N\)</span>, the fuzzy entropy is calculated as follows:</p>
<ol class="arabic simple">
<li><p>Reconstructs the phase space from the time series <span class="math notranslate nohighlight">\(X\)</span>, Form the sequence of vectors <span class="math notranslate nohighlight">\(\left\{ {{x_m}\left( 1 \right),{x_m}\left( 2 \right), \cdots ,{x_m}\left( {N - m + 1} \right)} \right\}\)</span>, The embedded dimension is the dimension of the vector <span class="math notranslate nohighlight">\(m\)</span>, where:</p></li>
</ol>
<div class="math notranslate nohighlight">
\[{x_m}\left( i \right) = \left\{ {x\left( i \right),x\left( {i + 1} \right), \cdots ,x\left( {i + m - 1} \right)} \right\} - x0\left( i \right),1 \le i \le N - m + 1 \tag{1}\]</div>
<div class="admonition important">
<p class="admonition-title">重要</p>
<p>Here <span class="math notranslate nohighlight">\(x0\left(i \right)\)</span> is the baseline vector, generalized by removing the baseline. <span class="math notranslate nohighlight">\(x0\left(i \right)\)</span> defined as</p>
</div>
<div class="math notranslate nohighlight">
\[x0\left( i \right) = \frac{1}{m}\sum\limits_{k = 0}^{m - 1} {{x_m}\left( {i + k} \right)} \tag{2}\]</div>
<ol class="arabic simple" start="2">
<li><p>Define the distance <span class="math notranslate nohighlight">\(d_{ij}^m\)</span> as the vector <span class="math notranslate nohighlight">\({x_m}\left(i \right)\)</span> and <span class="math notranslate nohighlight">\({x_m}\left(j \right)\)</span> The maximum value of the absolute difference of the corresponding element, i.e. Chebyshev distance:</p></li>
</ol>
<div class="math notranslate nohighlight">
\[d_{ij}^m = d\left[ {{x_m}\left( i \right),{x_m}\left( j \right)} \right] = \mathop {\max }\limits_{k = 0, \cdots ,m - 1} \left( {\left| {\left( {x\left( {i + k} \right) - x0\left( i \right)} \right) - \left( {x\left( {j + k} \right) - x0\left( j \right)} \right)} \right|} \right) \tag{3}\]</div>
<ol class="arabic simple" start="3">
<li><p>Given the fuzzy function arguments <span class="math notranslate nohighlight">\(n\)</span> and <span class="math notranslate nohighlight">\(r\)</span>, Compute <span class="math notranslate nohighlight">\({x_m}\left(j \right)\)</span> for <span class="math notranslate nohighlight">\({x_m}\left( i \right)\)</span> similarity:</p></li>
</ol>
<div class="math notranslate nohighlight">
\[D_{ij}^m\left( {n,r} \right) = \mu \left( {d_{ij}^m,n,r} \right) \tag{4}\]</div>
<div class="admonition important">
<p class="admonition-title">重要</p>
<p>The fuzzy function <span class="math notranslate nohighlight">\(\mu \left({d_{ij}^m,n,r} \right)\)</span> is an exponential function as follows:</p>
</div>
<div class="math notranslate nohighlight">
\[\mu \left( d_{ij}^{m},n,r \right)=\exp \left( {-{{\left( d_{ij}^{m} \right)}^{n}}}/{r}\; \right) \tag{5}\]</div>
<ol class="arabic simple" start="4">
<li><p>Define the function <span class="math notranslate nohighlight">\({\phi ^m}\left({n,r} \right)\)</span> as:</p></li>
</ol>
<div class="math notranslate nohighlight">
\[{\phi ^m}\left( {n,r} \right) = \frac{1}{{N - m + 1}}\sum\limits_{i = 1}^{N - m + 1} {\left( {\frac{1}{{N - m}}\sum\limits_{j = 1,j \ne i}^{N - m + 1} {D_{ij}^m} } \right)}  \tag{6}\]</div>
<ol class="arabic simple" start="5">
<li><p>Increase the dimension <span class="math notranslate nohighlight">\(m\)</span> to <span class="math notranslate nohighlight">\(m + 1\)</span>, repeat above (Steps 1- 4), get <span class="math notranslate nohighlight">\({\phi ^{m + 1}}\left({n,r} \right)\)</span></p></li>
<li><p>Fuzzy entropy can be defined as</p></li>
</ol>
<div class="math notranslate nohighlight">
\[FuzzyEn\left( {m,n,r} \right) = \mathop {\lim }\limits_{N \to \infty } \left[ {\ln {\phi ^m}\left( {n,r} \right) - \ln {\phi ^{m + 1}}\left( {n,r} \right)} \right] \tag{7}\]</div>
<p>For a sequence of finite length <span class="math notranslate nohighlight">\(N\)</span>, fuzzy entropy can be defined as</p>
<div class="math notranslate nohighlight">
\[FuzzyEn\left( {m,n,r,N} \right) = \ln {\phi ^m}\left( {n,r} \right) - \ln {\phi ^{m + 1}}\left( {n,r} \right) \tag{8}\]</div>
<div class="admonition note">
<p class="admonition-title">remark</p>
<blockquote>
<div><p>The fuzzy entropy is proposed by Chen et al. <a class="footnote-reference brackets" href="#id9" id="id2">1</a>, and the suggested parameters are as follows:</p>
</div></blockquote>
<ul class="simple">
<li><p>Embedding dimension  <span class="math notranslate nohighlight">\(m=2\)</span></p></li>
<li><p>tolerance  <span class="math notranslate nohighlight">\(r\)</span>   Generally take <cite>0.1~0.25</cite> times the standard deviation (SD) of the time series.</p></li>
<li><p>argument <span class="math notranslate nohighlight">\(n=2\)</span>  . In the subsequent simulation validation, we select <span class="math notranslate nohighlight">\(m=2\)</span> ,  <span class="math notranslate nohighlight">\(n=2\)</span> ，  <span class="math notranslate nohighlight">\(r = 0.15 \times {\rm{SD}}\)</span> 。</p></li>
</ul>
</div>
</section>
<section id="id3">
<h2>Code implementation<a class="headerlink" href="#id3" title="此标题的永久链接"></a></h2>
<p>It is assumed that you have obtained all the code for this project, if you have not obtained the relevant program at this time, please go to <a class="reference internal" href="../install.html"><span class="doc">Installation instructions</span></a></p>
<p>The core program of Fuzzy entropy is  <code class="docutils literal notranslate"><span class="pre">MultiscaleFuzzyEntropy_pdist_paran</span></code></p>
<div class="highlight-c++ notranslate"><div class="highlight"><pre><span></span><span class="n">function</span><span class="w"> </span><span class="n">MFE</span><span class="o">=</span><span class="n">MultiscaleFuzzyEntropy_pdist_paran</span><span class="p">(</span><span class="n">data</span><span class="p">,</span><span class="n">m</span><span class="p">,</span><span class="n">n</span><span class="p">,</span><span class="n">r</span><span class="p">,</span><span class="n">scale</span><span class="p">)</span><span class="w"></span>
<span class="w">    </span><span class="n">MFE</span><span class="o">=</span><span class="p">[];</span><span class="w"></span>
<span class="w">    </span><span class="k">for</span><span class="w"> </span><span class="n">j</span><span class="o">=</span><span class="mi">1</span><span class="o">:</span><span class="n">scale</span><span class="w"></span>
<span class="w">         </span><span class="n">Xs</span><span class="w"> </span><span class="o">=</span><span class="w"> </span><span class="n">Multi</span><span class="p">(</span><span class="n">data</span><span class="p">,</span><span class="n">j</span><span class="p">);</span><span class="w"></span>
<span class="w">         </span><span class="n">FE</span><span class="o">=</span><span class="n">FuzzyEntropy</span><span class="p">(</span><span class="n">Xs</span><span class="p">,</span><span class="n">m</span><span class="p">,</span><span class="n">n</span><span class="p">,</span><span class="n">r</span><span class="p">);</span><span class="w"></span>
<span class="w">         </span><span class="n">MFE</span><span class="o">=</span><span class="p">[</span><span class="n">MFE</span><span class="p">,</span><span class="n">FE</span><span class="p">];</span><span class="w"></span>
<span class="w">     </span><span class="n">end</span><span class="w"></span>
<span class="w"> </span><span class="n">end</span><span class="w"></span>
</pre></div>
</div>
<div class="admonition important">
<p class="admonition-title">重要</p>
<p>The information of each input parameter is as follows:</p>
<ul class="simple">
<li><p><code class="docutils literal notranslate"><span class="pre">data</span></code>: The input time series is the column vector</p></li>
<li><p><code class="docutils literal notranslate"><span class="pre">m</span></code> : Embedding dimension</p></li>
<li><p><code class="docutils literal notranslate"><span class="pre">r</span></code> : tolerance</p></li>
<li><p><code class="docutils literal notranslate"><span class="pre">scale</span></code> : scale ratio</p></li>
</ul>
</div>
</section>
<section id="id4">
<h2>Simulation verification<a class="headerlink" href="#id4" title="此标题的永久链接"></a></h2>
<section id="id5">
<h3>The result of pulse detection of fuzzy entropy<a class="headerlink" href="#id5" title="此标题的永久链接"></a></h3>
<figure class="align-center">
<img alt="The result of pulse detection of fuzzy entropy" src="/assets/Downloads/单尺度脉冲检测结果/FE.emf.svg" />
</figure>
</section>
<section id="id6">
<h3>Visual results of fault classification based on multi-scale fuzzy entropy<a class="headerlink" href="#id6" title="此标题的永久链接"></a></h3>
<figure class="align-center">
<img alt="Visual results of fault classification based on multi-scale fuzzy entropy" src="/assets/Downloads/多尺度可视化结果/MultiFuzzEn.emf.svg" />
</figure>
</section>
<section id="id7">
<h3>Noise resistance analysis<a class="headerlink" href="#id7" title="此标题的永久链接"></a></h3>
<figure class="align-center">
<img alt="Noise resistance analysis" src="/assets/Downloads/抗噪性结果/FE.emf.svg" />
</figure>
</section>
<section id="id8">
<h3>Computational efficiency result<a class="headerlink" href="#id8" title="此标题的永久链接"></a></h3>
<figure class="align-center">
<img alt="Computational efficiency result" src="/assets/Downloads/计算效率结果/FE.emf.svg" />
</figure>
<dl class="footnote brackets">
<dt class="label" id="id9"><span class="brackets"><a class="fn-backref" href="#id2">1</a></span></dt>
<dd><ol class="upperalpha simple" start="23">
<li><p>Chen, Z. Wang, H. Xie, and W. Yu, “Characterization of Surface EMG Signal Based on Fuzzy Entropy,” IEEE Trans. Neural Syst. Rehabil. Eng., vol. 15, no. 2, pp. 266–272, Jun. 2007, doi: 10.1109/TNSRE.2007.897025.</p></li>
</ol>
</dd>
</dl>
</section>
</section>
</section>


           </div>
          </div>
          <footer><div class="rst-footer-buttons" role="navigation" aria-label="页脚">
        <a href="2%20Sample%20entropy%20.html" class="btn btn-neutral float-left" title="样本熵(Sample entropy)" accesskey="p" rel="prev"><span class="fa fa-arrow-circle-left" aria-hidden="true"></span> 上一页</a>
        <a href="4%20Permutation%20Entropy.html" class="btn btn-neutral float-right" title="排列熵(Permutation Entropy)" accesskey="n" rel="next">下一页 <span class="fa fa-arrow-circle-right" aria-hidden="true"></span></a>
    </div>

  <hr/>

  
   

</footer>
        </div>
      </div>
    </section>
    
	
	
	{% endraw %}
