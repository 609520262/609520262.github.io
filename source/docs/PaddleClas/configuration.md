---
title: quick_start
date: 2023-03-08 20:35:48
---

{% raw %}


  <section data-toggle="wy-nav-shift" class="wy-nav-content-wrap">

      
      <nav class="wy-nav-top" aria-label="top navigation">
        
          <i data-toggle="wy-nav-top" class="fa fa-bars"></i>
          <a href="../index.html">PaddleClas</a>
        
      </nav>


      <div class="wy-nav-content">
        
        <div class="rst-content">
        
          















<div role="navigation" aria-label="breadcrumbs navigation">

  <ul class="wy-breadcrumbs">
    
      <li><a href="../index.html">Docs</a> »</li>
        
          <li><a href="index.html">初级使用</a> »</li>
        
      <li>配置说明</li>
    
    
      <li class="wy-breadcrumbs-aside">
        
            
            
              <a href="https://github.com/PaddlePaddle/PaddleClas/blob/master/docs/zh_CN/tutorials/config.md" class="fa fa-github"> Edit on GitHub</a>
            
          
        
      </li>
    
  </ul>

  
  <hr>
</div>
          <div role="main" class="document" itemscope="itemscope" itemtype="http://schema.org/Article">
           <div itemprop="articleBody">
            
  <div class="section" id="id1">
<h1>配置说明<a class="headerlink" href="#id1" title="永久链接至标题">¶</a></h1>
<hr class="docutils">
<div class="section" id="id2">
<h2>简介<a class="headerlink" href="#id2" title="永久链接至标题">¶</a></h2>
<p>本文档介绍了PaddleClas配置文件(configs/*.yaml)中各参数的含义，以便您更快的自定义或修改超参数配置。</p>
</div>
<div class="section" id="id3">
<h2>配置详解<a class="headerlink" href="#id3" title="永久链接至标题">¶</a></h2>
<div class="section" id="id4">
<h3>基础配置<a class="headerlink" href="#id4" title="永久链接至标题">¶</a></h3>
<div class="wy-table-responsive"><table border="1" class="docutils">
<thead>
<tr>
<th align="center">参数名字</th>
<th align="center">具体含义</th>
<th align="center">默认值</th>
<th align="center">可选值</th>
</tr>
</thead>
<tbody>
<tr>
<td align="center">mode</td>
<td align="center">运行模式</td>
<td align="center">"train"</td>
<td align="center">["train"," valid"]</td>
</tr>
<tr>
<td align="center">architecture</td>
<td align="center">模型结构名字</td>
<td align="center">"ResNet50_vd"</td>
<td align="center">PaddleClas提供的模型结构</td>
</tr>
<tr>
<td align="center">pretrained_model</td>
<td align="center">预训练模型路径</td>
<td align="center">""</td>
<td align="center">Str</td>
</tr>
<tr>
<td align="center">model_save_dir</td>
<td align="center">保存模型路径</td>
<td align="center">""</td>
<td align="center">Str</td>
</tr>
<tr>
<td align="center">classes_num</td>
<td align="center">分类数</td>
<td align="center">1000</td>
<td align="center">int</td>
</tr>
<tr>
<td align="center">total_images</td>
<td align="center">总图片数</td>
<td align="center">1281167</td>
<td align="center">int</td>
</tr>
<tr>
<td align="center">save_interval</td>
<td align="center">每隔多少个epoch保存模型</td>
<td align="center">1</td>
<td align="center">int</td>
</tr>
<tr>
<td align="center">validate</td>
<td align="center">是否在训练时进行评估</td>
<td align="center">TRUE</td>
<td align="center">bool</td>
</tr>
<tr>
<td align="center">valid_interval</td>
<td align="center">每隔多少个epoch进行模型评估</td>
<td align="center">1</td>
<td align="center">int</td>
</tr>
<tr>
<td align="center">epochs</td>
<td align="center">训练总epoch数</td>
<td align="center"></td>
<td align="center">int</td>
</tr>
<tr>
<td align="center">topk</td>
<td align="center">评估指标K值大小</td>
<td align="center">5</td>
<td align="center">int</td>
</tr>
<tr>
<td align="center">image_shape</td>
<td align="center">图片大小</td>
<td align="center">[3，224，224]</td>
<td align="center">list, shape: (3,)</td>
</tr>
<tr>
<td align="center">use_mix</td>
<td align="center">是否启用mixup</td>
<td align="center">False</td>
<td align="center">['True', 'False']</td>
</tr>
<tr>
<td align="center">ls_epsilon</td>
<td align="center">label_smoothing epsilon值</td>
<td align="center">0</td>
<td align="center">float</td>
</tr>
</tbody>
</table></div></div>
<div class="section" id="id5">
<h3>学习率与优化器<a class="headerlink" href="#id5" title="永久链接至标题">¶</a></h3>
<p>学习率</p>
<div class="wy-table-responsive"><table border="1" class="docutils">
<thead>
<tr>
<th align="center">参数名字</th>
<th align="center">具体含义</th>
<th align="center">默认值</th>
<th align="center">可选值</th>
</tr>
</thead>
<tbody>
<tr>
<td align="center">function</td>
<td align="center">decay方法名</td>
<td align="center">"Linear"</td>
<td align="center">["Linear", "Cosine", <br> "Piecewise", "CosineWarmup"]</td>
</tr>
<tr>
<td align="center">params.lr</td>
<td align="center">初始学习率</td>
<td align="center">0.1</td>
<td align="center">float</td>
</tr>
<tr>
<td align="center">params.decay_epochs</td>
<td align="center">piecewisedecay中<br>衰减学习率的milestone</td>
<td align="center"></td>
<td align="center">list</td>
</tr>
<tr>
<td align="center">params.gamma</td>
<td align="center">piecewisedecay中gamma值</td>
<td align="center">0.1</td>
<td align="center">float</td>
</tr>
<tr>
<td align="center">params.warmup_epoch</td>
<td align="center">warmup轮数</td>
<td align="center">5</td>
<td align="center">int</td>
</tr>
<tr>
<td align="center">parmas.steps</td>
<td align="center">lineardecay衰减steps数</td>
<td align="center">100</td>
<td align="center">int</td>
</tr>
<tr>
<td align="center">params.end_lr</td>
<td align="center">lineardecayend_lr值</td>
<td align="center">0</td>
<td align="center">float</td>
</tr>
</tbody>
</table></div><p>优化器</p>
<div class="wy-table-responsive"><table border="1" class="docutils">
<thead>
<tr>
<th align="center">参数名字</th>
<th align="center">具体含义</th>
<th align="center">默认值</th>
<th align="center">可选值</th>
</tr>
</thead>
<tbody>
<tr>
<td align="center">function</td>
<td align="center">优化器方法名</td>
<td align="center">"Momentum"</td>
<td align="center">["Momentum", "RmsProp"]</td>
</tr>
<tr>
<td align="center">params.momentum</td>
<td align="center">momentum值</td>
<td align="center">0.9</td>
<td align="center">float</td>
</tr>
<tr>
<td align="center">regularizer.function</td>
<td align="center">正则化方法名</td>
<td align="center">"L2"</td>
<td align="center">["L1", "L2"]</td>
</tr>
<tr>
<td align="center">regularizer.factor</td>
<td align="center">正则化系数</td>
<td align="center">0.0001</td>
<td align="center">float</td>
</tr>
</tbody>
</table></div></div>
<div class="section" id="id6">
<h3>数据读取器与数据处理<a class="headerlink" href="#id6" title="永久链接至标题">¶</a></h3>
<div class="wy-table-responsive"><table border="1" class="docutils">
<thead>
<tr>
<th align="center">参数名字</th>
<th align="center">具体含义</th>
</tr>
</thead>
<tbody>
<tr>
<td align="center">batch_size</td>
<td align="center">批大小</td>
</tr>
<tr>
<td align="center">num_workers</td>
<td align="center">数据读取器worker数量</td>
</tr>
<tr>
<td align="center">file_list</td>
<td align="center">train文件列表</td>
</tr>
<tr>
<td align="center">data_dir</td>
<td align="center">train文件路径</td>
</tr>
<tr>
<td align="center">shuffle_seed</td>
<td align="center">用来进行shuffle的seed值</td>
</tr>
</tbody>
</table></div><p>数据处理</p>
<div class="wy-table-responsive"><table border="1" class="docutils">
<thead>
<tr>
<th align="center">功能名字</th>
<th align="center">参数名字</th>
<th align="center">具体含义</th>
</tr>
</thead>
<tbody>
<tr>
<td align="center">DecodeImage</td>
<td align="center">to_rgb</td>
<td align="center">数据转RGB</td>
</tr>
<tr>
<td align="center"></td>
<td align="center">to_np</td>
<td align="center">数据转numpy</td>
</tr>
<tr>
<td align="center"></td>
<td align="center">channel_first</td>
<td align="center">按CHW排列的图片数据</td>
</tr>
<tr>
<td align="center">RandCropImage</td>
<td align="center">size</td>
<td align="center">随机裁剪</td>
</tr>
<tr>
<td align="center">RandFlipImage</td>
<td align="center"></td>
<td align="center">随机翻转</td>
</tr>
<tr>
<td align="center">NormalizeImage</td>
<td align="center">scale</td>
<td align="center">归一化scale值</td>
</tr>
<tr>
<td align="center"></td>
<td align="center">mean</td>
<td align="center">归一化均值</td>
</tr>
<tr>
<td align="center"></td>
<td align="center">std</td>
<td align="center">归一化方差</td>
</tr>
<tr>
<td align="center"></td>
<td align="center">order</td>
<td align="center">归一化顺序</td>
</tr>
<tr>
<td align="center">ToCHWImage</td>
<td align="center"></td>
<td align="center">调整为CHW</td>
</tr>
<tr>
<td align="center">CropImage</td>
<td align="center">size</td>
<td align="center">裁剪大小</td>
</tr>
<tr>
<td align="center">ResizeImage</td>
<td align="center">resize_short</td>
<td align="center">按短边调整大小</td>
</tr>
</tbody>
</table></div><p>mix处理</p>
<div class="wy-table-responsive"><table border="1" class="docutils">
<thead>
<tr>
<th align="center">参数名字</th>
<th align="center">具体含义</th>
</tr>
</thead>
<tbody>
<tr>
<td align="center">MixupOperator.alpha</td>
<td align="center">mixup处理中的alpha值</td>
</tr>
</tbody>
</table></div></div>
</div>
</div>


           </div>
           
          </div>
          <footer>
  
    <div class="rst-footer-buttons" role="navigation" aria-label="footer navigation">
      
        <a href="../models/index.html" class="btn btn-neutral float-right" title="模型库" accesskey="n" rel="next">Next <span class="fa fa-arrow-circle-right"></span></a>
      
      
        <a href="getting_started.html" class="btn btn-neutral float-left" title="开始使用" accesskey="p" rel="prev"><span class="fa fa-arrow-circle-left"></span> Previous</a>
      
    </div>
  

  <hr><div><div id="rtd-sidebar" data-ea-publisher="readthedocs" data-ea-type="readthedocs-sidebar" data-ea-manual="true" class="ethical-rtd" data-ea-keywords="only words|paddleclas|readthedocs-project-593273|readthedocs-project-paddleclas" data-ea-campaign-types="community|house|paid"></div></div>

  
</footer>

        </div>
      </div>

    </section>
	
	
	{% endraw %}
