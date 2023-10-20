---
title: Symbolic_dynamic_Entropy
date: 2023-03-08 22:08:03
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
      <li class="breadcrumb-item active">Symbolic dynamic Entropy</li>
<li class="wy-breadcrumbs-aside">
   <a href="https://github.com/609520262/Deploy-static-content-to-Pages/tree/main/docs/index.rst" class="fa fa-github"> Edit it on GitHub</a>
</li>

  </ul>
  <hr/>
</div>
          <div role="main" class="document" itemscope="itemscope" itemtype="http://schema.org/Article">
           <div itemprop="articleBody">
             
  <section id="symbolic-dynamic-entropy">
<h1>Symbolic dynamic Entropy<a class="headerlink" href="#symbolic-dynamic-entropy" title="此标题的永久链接"></a></h1>
<section id="id1">
<h2>Basic principle<a class="headerlink" href="#id1" title="此标题的永久链接"></a></h2>
<p>Given a time series <span class="math notranslate nohighlight">\(\left\{{u\left(i \right),1 \le i \le N} \right\}\)</span>of length <span class="math notranslate nohighlight">\(N\)</span> , the symbolic kinetic entropy is calculated as follows:</p>
<ol class="arabic simple">
<li><p>The maximum entropy partition (MEP) is used to symbolize the time series in amplitude domain. The elements of a time series are converted to symbols <span class="math notranslate nohighlight">\({\sigma _i}\left({i = 1,2, \cdots,\varepsilon} \right)\)</span>. You can get the symbolized time series <span class="math notranslate nohighlight">\(Z\left\{{z\left(k \right),k = 1,2, \cdots,N} \right\}\)</span>.</p></li>
<li><p>The symbolic time series is reconstructed in phase space and the probability of possible state modes is calculated. The embedding dimension is <span class="math notranslate nohighlight">\(m\)</span>, When time delay is <span class="math notranslate nohighlight">\(\lambda\)</span>, <span class="math notranslate nohighlight">\(Z\left\{{z\left(k \right),k = 1,2, \cdots,N} \right\}\)</span> Reconstructing the phase space yields a series of embedding vectors:</p></li>
</ol>
<div class="math notranslate nohighlight">
\[Z_j^{m,\lambda }\left\{ {z\left( j \right),z\left( {j + 1 \times \lambda } \right), \cdots ,z\left( {j + \left( {m - 1} \right) \times \lambda } \right)} \right\},j = 1,2, \cdots ,N - \left( {m - 1} \right)\lambda \tag{1}\]</div>
<div class="admonition important">
<p class="admonition-title">重要</p>
<p>The vector <span class="math notranslate nohighlight">\(Z_j^{m,\lambda}\)</span> has <span class="math notranslate nohighlight">\(m\)</span> elements, each of which has <span class="math notranslate nohighlight">\(\varepsilon\)</span> possible symbols, Therefore, there are <span class="math notranslate nohighlight">\({\varepsilon ^m}\)</span> possible state modes. The state of a vector can be expressed as <span class="math notranslate nohighlight">\(q_a^{\varepsilon,m,\lambda}\left({a = 1,2, \cdots,{\varepsilon ^m}} \right)\)</span>. Therefore, Probability of possible state modes <span class="math notranslate nohighlight">\(P\left({q_a^{\varepsilon,m,\lambda}} \right)\)</span> It can be calculated as follows:</p>
</div>
<div class="math notranslate nohighlight">
\[P\left( {q_a^{\varepsilon ,m,\lambda }} \right) = \frac{{\left\| {\left\{ {j:j \le N - \left( {m - 1} \right)\lambda ,type\left( {Z_j^{\varepsilon ,m,\lambda }} \right) = q_a^{\varepsilon ,m,\lambda }} \right\}} \right\|}}{{N - \left( {m - 1} \right)\lambda }} \tag{2}\]</div>
<ol class="arabic simple" start="3">
<li><p>Construct state transition and calculate state transition probability. State transition refers to a symbolic time series that moves from one state to the next (including a self-loop). When the status mode is <span class="math notranslate nohighlight">\(q_a^{\varepsilon,m,\lambda}\left({a = 1,2, \cdots,{\varepsilon ^m}} \right)\)</span>, Transfer to next state The state transition probability is the symbol <span class="math notranslate nohighlight">\({\sigma _b}\left({b = 1,2, \cdots,\varepsilon} \right)\)</span> the conditional probability is as follows:</p></li>
</ol>
<div class="math notranslate nohighlight">
\[P\left( {{\sigma _b}|q_a^{\varepsilon ,m,\lambda }} \right) = P\left\{ {z\left( {j + m\lambda } \right) = {\sigma _b}|j:j \le N - m\lambda ,type\left( {Z_j^{\varepsilon ,m,\lambda }} \right) = q_a^{\varepsilon ,m,\lambda }} \right\}    \tag{3}\]</div>
<div class="admonition important">
<p class="admonition-title">重要</p>
<p>Where <span class="math notranslate nohighlight">\(a = 1,2, \cdots,{\varepsilon ^m}\)</span>, <span class="math notranslate nohighlight">\(b = 1,2, \cdots,\varepsilon\)</span>, <span class="math notranslate nohighlight">\(\varepsilon\)</span> is a symbol number, <span class="math notranslate nohighlight">\({\varepsilon ^m}\)</span> is the number of states. The state probability satisfies the condition <span class="math notranslate nohighlight">\(\sum\limits_{b = 1}^\varepsilon  {P\left( {{\sigma _b}|q_a^{\varepsilon ,m,\lambda }} \right)}  = 1\)</span>. <span class="math notranslate nohighlight">\(P\left({{\sigma _b}|q_a^{\varepsilon,m,\lambda}} \right)\)</span> can be expressed as:</p>
</div>
<div class="math notranslate nohighlight">
\[P\left( {{\sigma _b}|q_a^{\varepsilon ,m,\lambda }} \right) = \frac{{\left\| {\left\{ {j:j \le N - m\lambda ,type\left( {Z_j^{\varepsilon ,m,\lambda }} \right) = q_a^{\varepsilon ,m,\lambda },z\left( {j + m\lambda } \right) = {\sigma _b}} \right\}} \right\|}}{{N - m\lambda }} \tag{4}\]</div>
<ol class="arabic simple" start="4">
<li><p>Symbolic kinetic entropy is defined as the sum of state entropy and state transition entropy, expressed as:</p></li>
</ol>
<div class="math notranslate nohighlight">
\[SDE\left( {X,m,\lambda ,\varepsilon } \right) =  - \sum\limits_{a = 1}^{{\varepsilon ^m}} {P\left( {q_a^{\varepsilon ,m,\lambda }} \right)\ln P\left( {q_a^{\varepsilon ,m,\lambda }} \right)}  - \sum\limits_{a = 1}^{{\varepsilon ^m}} {\sum\limits_{b = 1}^\varepsilon  {P\left( {q_a^{\varepsilon ,m,\lambda }} \right)\ln \left( {P\left( {q_a^{\varepsilon ,m,\lambda }} \right)P\left( {{\sigma _b}|q_a^{\varepsilon ,m,\lambda }} \right)} \right)} }   \tag{5}\]</div>
<ol class="arabic simple" start="5">
<li><p>The maximum symbolic entropy is <span class="math notranslate nohighlight">\(\ln \left({{\varepsilon ^{m + 1}}} \right)\)</span>, This means that all state probabilities and state transition probabilities have the same value <span class="math notranslate nohighlight">\(\left(P\left(q_{a}^{\varepsilon,m,\lambda} \right)={1}/{{{\varepsilon }^{m}}}\; ,P\left( {{\sigma }_{b}}|q_{a}^{\varepsilon ,m,\lambda } \right)={1}/{\varepsilon }\;  \right)\)</span>. The symbolic dynamic entropy after standardized processing can be expressed as:</p></li>
</ol>
<div class="math notranslate nohighlight">
\[SDE\left( X,m,\lambda ,\varepsilon  \right)={SDE\left( X,m,\lambda ,\varepsilon  \right)}/{\ln \left( {{\varepsilon }^{m+1}} \right)} \tag{6}\]</div>
<div class="admonition note">
<p class="admonition-title">备注</p>
<p>Symbolic dynamic entropy is proposed by Li et al. <a class="footnote-reference brackets" href="#id9" id="id2">1</a>, and the suggested parameters are as follows:</p>
<ul class="simple">
<li><p>Embedding dimension  <span class="math notranslate nohighlight">\(m = 3\)</span></p></li>
<li><p>Symbolic number  <span class="math notranslate nohighlight">\(\varepsilon  = 12\)</span></p></li>
<li><p>Time delay  <span class="math notranslate nohighlight">\(\lambda  = 1\)</span></p></li>
</ul>
</div>
</section>
<section id="id3">
<h2>Code implementation<a class="headerlink" href="#id3" title="此标题的永久链接"></a></h2>
<p>It is assumed that you have obtained all the code for this project, if you have not obtained the relevant program at this time, please go to  <a class="reference internal" href="../install.html"><span class="doc">Installation instructions</span></a></p>
<p>The core program of Symbolic dynamic Entropy is  <code class="docutils literal notranslate"><span class="pre">MultiscaleSymbolicDynamicEntropy</span></code></p>
<div class="highlight-c++ notranslate"><div class="highlight"><pre><span></span>function MSDE=MultiscaleSymbolicDynamicEntropy(data,m,Sym,scale)

   MSDE=[];
   data=data&#39;;
   for j=1:scale
      Xs = Multi(data,j,2);
      SDE=SymbolDynamicEntropy(Xs,m,Sym);
      MSDE=[MSDE,SDE];
   end
 end
</pre></div>
</div>
<div class="admonition important">
<p class="admonition-title">重要</p>
<p>The information of each input parameter is as follows:</p>
<ul class="simple">
<li><p><code class="docutils literal notranslate"><span class="pre">data</span></code>: The input time series is the column vector</p></li>
<li><p><code class="docutils literal notranslate"><span class="pre">m</span></code>: Embedding dimension</p></li>
<li><p><code class="docutils literal notranslate"><span class="pre">Sym</span></code>: symbol sequence</p></li>
<li><p><code class="docutils literal notranslate"><span class="pre">scale</span></code>: scale ratio</p></li>
</ul>
</div>
</section>
<section id="id4">
<h2>Simulation verification<a class="headerlink" href="#id4" title="此标题的永久链接"></a></h2>
<section id="id5">
<h3>Pulse detection results of symbolic kinetic entropy<a class="headerlink" href="#id5" title="此标题的永久链接"></a></h3>
<figure class="align-center">
<img alt="Pulse detection results of symbolic kinetic entropy" src="/assets/Downloads/单尺度脉冲检测结果/SDE.emf.svg" />
</figure>
</section>
<section id="id6">
<h3>Visual results of fault classification based on multi-scale symbolic dynamic entropy<a class="headerlink" href="#id6" title="此标题的永久链接"></a></h3>
<figure class="align-center">
<img alt="Visual results of fault classification based on multi-scale symbolic dynamic entropy" src="/assets/Downloads/多尺度可视化结果/MultiSymbolicDynamicEntropy.emf.svg" />
</figure>
</section>
<section id="id7">
<h3>Noise resistance analysis<a class="headerlink" href="#id7" title="此标题的永久链接"></a></h3>
<figure class="align-center">
<img alt="Noise resistance analysis" src="/assets/Downloads/抗噪性结果/SDE.emf.svg" />
</figure>
</section>
<section id="id8">
<h3>Computational efficiency result<a class="headerlink" href="#id8" title="此标题的永久链接"></a></h3>
<figure class="align-center">
<img alt="Computational efficiency result" src="/assets/Downloads/计算效率结果/SDE.emf.svg" />
</figure>
<dl class="footnote brackets">
<dt class="label" id="id9"><span class="brackets"><a class="fn-backref" href="#id2">1</a></span></dt>
<dd><ol class="upperalpha simple" start="25">
<li><p>Li, Y. Yang, G. Li, M. Xu, and W. Huang, “A fault diagnosis scheme for planetary gearboxes using modified multi-scale symbolic dynamic entropy and mRMR feature selection,” Mech. Syst. Signal Process., vol. 91, pp. 295–312, Jul. 2017, doi: 10.1016/j.ymssp.2016.12.040.</p></li>
</ol>
</dd>
</dl>
</section>
</section>
</section>


           </div>
          </div>
          <footer><div class="rst-footer-buttons" role="navigation" aria-label="页脚">
        <a href="6%20Distribution%20Entropy.html" class="btn btn-neutral float-left" title="分布熵(Distribution Entropy)" accesskey="p" rel="prev"><span class="fa fa-arrow-circle-left" aria-hidden="true"></span> 上一页</a>
        <a href="8%20Dispersion%20Entropy.html" class="btn btn-neutral float-right" title="色散熵(Dispersion Entropy)" accesskey="n" rel="next">下一页 <span class="fa fa-arrow-circle-right" aria-hidden="true"></span></a>
    </div>

  <hr/>

 
   

</footer>
        </div>
      </div>
    </section>


  {% endraw %}